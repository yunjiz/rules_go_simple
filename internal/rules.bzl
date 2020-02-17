"""Rules for building Go programs.
Rules take a description of something to build (for example, the sources and
dependencies of a library) and create a plan of how to build it (output files,
actions).
"""

load(":actions.bzl", "go_compile", "go_link")

def _go_binary_impl(ctx):
    # Declare an output file for the main package and compile it from srcs. All
    # our output files will start with a prefix to avoid conflicting with
    # other rules.
    prefix = ctx.label.name + "%/"
    main_archive = ctx.actions.declare_file(prefix + "main.a")
    go_compile(
        ctx,
        srcs = ctx.files.srcs,
        out = main_archive,
    )

    # Declare an output file for the executable and link it. Note that output
    # files may not have the same name as the rule, so we still need to use the
    # prefix here.
    executable = ctx.actions.declare_file(prefix + ctx.label.name)
    go_link(
        ctx,
        main = main_archive,
        out = executable,
    )

    # Return the DefaultInfo provider. This tells Bazel what files should be
    # built when someone asks to build a go_binary rules. It also says which
    # one is executable (in this case, there's only one).
    return [DefaultInfo(
        files = depset([executable]),
        executable = executable,
    )]

# Declare the go_binary rule. This statement is evaluated during the loading
# phase when this file is loaded. The function body above is evaluated only
# during the analysis phase.
go_binary = rule(
    _go_binary_impl,
    attrs = {
        "srcs" : attr.label_list(
            allow_files = [".go"],
            doc = "Source files to compile for the main package of this binary",
        ),
    },
    doc = "Builds an executable program from Go source code",
    executable = True,
)