load("@bazel-orfs//:cc.bzl", "cc_import_binary")

filegroup(
    name = "yosys",
    srcs = ["bin/yosys"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "share",
    srcs = glob([ "share/yosys/**"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "mk",
    srcs = glob(["flow/**/*.mk", "flow/**/*.py", "flow/**/*.tcl", "flow/**/*.pl", "flow/**/*.script"]),
)

filegroup(
    name = "makefile",
    srcs = ["flow/Makefile"],
    data = [":mk"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "lib",
    srcs = glob(["flow/platforms/**/*.lib.gz", "flow/platforms/**/*.lef", "flow/platforms/**/*.lib", "flow/platforms/**/*.rules", "flow/platforms/**/*.v"]),
    visibility = ["//visibility:public"],
)

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
    visibility = ["//visibility:public"],
)

cc_import_binary(
    name = "sta",
    executable = ":bin/sta",
    visibility = ["//visibility:public"],
)

