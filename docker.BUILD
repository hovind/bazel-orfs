load("@bazel-orfs//:cc.bzl", "cc_import_binary")

cc_import(
	name = "ortools",
    shared_library = ":lib/libortools.so.9",
)

cc_import(
	name = "tclreadline",
    shared_library = ":lib/libtclreadline-2.3.8.so",
)

cc_import_binary(
    name = "openroad",
    deps = [
        ":ortools",
        ":tclreadline",
    ],
    executable = ":bin/openroad",
)

cc_import_binary(
    name = "sta",
    executable = ":bin/sta",
)
