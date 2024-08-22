/*
** EPITECH PROJECT, 2023
** MiniLibC-Assembly [WSL: Manjaro]
** File description:
** memset
*/

#include <criterion/criterion.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <gnu/lib-names.h>
#include <criterion/redirect.h>

size_t (*my_strlen)(const char *);

void init_all()
{
    void *handle;
    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "%s\n", dlerror());
        exit(EXIT_FAILURE);
    }
    my_strlen = dlsym(handle, "strlen");
}
Test(test_bas, basic, .init = init_all)
{
    size_t length = my_strlen("hello");
    cr_assert_eq(strlen("hello"), length);
}
