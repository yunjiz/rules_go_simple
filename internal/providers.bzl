GoLibraryInfo = provider(
    doc = "Contains information about a Go library",
    fields = {
        "info": """A struct containing information about this library.
        Has the following fields:
                    importpath: Name by which the library may be imported.
                    archive: The .a file compiled from the library's sources.""",
        "deps": "A depset of info structs for this library's dependencies",
    },
)