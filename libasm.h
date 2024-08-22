/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-killian1.lelong [WSL: Ubuntu]
** File description:
** libminic
*/

#ifndef LIBASM_H_
#define LIBASM_H_

int strlen(char const *str);
char *strchr(const char *str, char c);
void *memset(void *s, char c, unsigned long n);
void *memcpy(void *dest, const void *src, unsigned long n);

#endif /* !LIBASM_H_ */
