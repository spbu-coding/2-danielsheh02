#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>

#define error(...) (fprintf(stderr, __VA_ARGS__))
#define MAX_NUMBERS_ARRAY 100
int size_array_of_numbers = 0;

void free_array_of_numbers(long long int *array_of_numbers) {
    free(array_of_numbers);
}

extern void sorted_of_numbers(long long int *array_of_numbers, int size_array_of_numbers);

long long int *input_numbers(long long int left_border, long long int right_border, int invalid_parameter,
                             int availability_valid_parameter) {
    long long int number;
    char space = ' ';
    long long int *array_of_numbers = malloc(MAX_NUMBERS_ARRAY * sizeof(long long int));
    if (!array_of_numbers) {
        free_array_of_numbers(array_of_numbers);
        error("Cannot allocate memory for array int in experiment\n");
        return NULL;
    }

    if (printf("Enter numbers in sequence ") < 0) {
        error("Cannot write to stdout\n");
        return NULL;
    }
    while (space != '\n') {
        scanf("%lld%c", &number, &space);
        if ((invalid_parameter == 1) || (availability_valid_parameter == 1)) {
            if (left_border == 0) {
                if ((number >= right_border)) {
                    error ("%lld ", number);
                } else {
                    array_of_numbers[size_array_of_numbers] = number;
                    size_array_of_numbers++;
                }
            } else if (right_border == 0) {
                if ((number <= left_border)) {
                    printf("%lld ", number);
                } else {
                    array_of_numbers[size_array_of_numbers] = number;
                    size_array_of_numbers++;
                }
            }
        } else if ((invalid_parameter != 1) && (availability_valid_parameter != 1)) {
            if ((number > left_border) && (number < right_border)) {
                array_of_numbers[size_array_of_numbers] = number;
                size_array_of_numbers++;
            }
            if ((number >= right_border)) {
                error ("%lld ", number);
            }
            if ((number <= left_border)) {
                printf("%lld ", number);
            }
        }
    }
    printf("\n");
    return array_of_numbers;
}

int main(int argc, char **argv) {
    int availability_valid_parameter = 0;
    int invalid_parameter = 0;
    int diff_count = 0;
    char c = 0;
    int rez;
    int option_index = -1;
    long long int left_border = 0;
    long long int right_border = 0;
    if (argc < 2) {
        return -1;
    }
    if (argc > 3) {
        return -2;
    }
    const char *short_options = "f::t::";
    const struct option long_options[] = {
            {"from", optional_argument, NULL, '1'},
            {"to",   optional_argument, NULL, '2'},
            {NULL,   0,                 NULL, 0}
    };
    while ((rez = getopt_long(argc, argv, short_options, long_options, &option_index)) != -1) {
        switch (rez) {
            case '1': {
                if (c == 0) {
                    c = '1';
                } else if (c == '1') {
                    return -3;
                }
                if (optarg == NULL) {
                    printf("found 'from' without value\n");
                }
                left_border = strtoll(optarg, NULL, 10);
                availability_valid_parameter++;
                break;
            }
            case '2': {
                if (c == 0) {
                    c = '2';
                } else if (c == '2') {
                    return -3;
                }
                if (optarg == NULL) {
                    printf("found 'to' without value\n");
                }
                right_border = strtoll(optarg, NULL, 10);
                availability_valid_parameter++;
                break;
            }
            case '?':
            default: {
                printf("found unknown option\n");
                invalid_parameter++;
                break;
            }
        }
    }
    if ((invalid_parameter == 2) || (availability_valid_parameter == 0) || (option_index < 0)) {
        return -4;
    }
    long long int *array_of_numbers = input_numbers(left_border, right_border, invalid_parameter,
                                                    availability_valid_parameter);
    if (!array_of_numbers) {
        return -10;
    }
    long long int *old_array_of_numbers = malloc(size_array_of_numbers * sizeof(long long int));
    if (!old_array_of_numbers) {
        free_array_of_numbers(old_array_of_numbers);
        error("Cannot allocate memory for array int in experiment\n");
        return -10;
    }

    for (int i = 0; i < size_array_of_numbers; i++) {
        old_array_of_numbers[i] = array_of_numbers[i];
    }
    sorted_of_numbers(array_of_numbers, size_array_of_numbers);
    for (int i = 0; i < size_array_of_numbers; i++) {
        if (array_of_numbers[i] != old_array_of_numbers[i]) {
            diff_count++;
        }
    }

    free_array_of_numbers(array_of_numbers);
    free_array_of_numbers(old_array_of_numbers);
    return diff_count;
}
