# - * - tryb: sh - * -
# Bach Testing Framework, https://bach.sh
# Prawa autorskie (C) 2019 Chai Feng <chaifeng@chaifeng.com>
#
# Bach Testing Framework jest objęty podwójną licencją w ramach:
# - Powszechna Licencja Publiczna GNU v3.0
# - Licencja publiczna Mozilla 2.0
ustaw -euo pipefail
shopt -s expand_aliases

export BACH_COLOR = "$ {BACH_COLOR: -auto}"
eksportuj PS4 = '+ ($ {BASH_SOURCE ## * /}: $ {LINENO}): $ {FUNCNAME [0]: + $ {FUNCNAME [0]} ():}'

BACH_OS_NAME = "$ (uname)"
zadeklaruj -gxr BACH_OS_NAME

zadeklaruj -gxa bach_origin_paths = ()
podczas wbudowanego odczytu -r -d: folder; robić
    bach_origin_paths + = ("$ folder")
gotowe <<< "$ {PATH}:"

function @out () {
    if [["$ {1: -}" == "-" || ! -t 0]]; następnie
        [["$ {1: -}" == "-"]] && shift
        podczas gdy IFS = $ '\ n' read -r line; robić
            printf "% s \ n" "$ {*} $ line"
        Gotowe
    elif [["$ #" -gt 0]]; następnie
        printf "% s \ n" "$ *"
    jeszcze
        printf "\ n"
    fi
} 8> / dev / null
eksportuj -f @out

function @err () {
    @out „$ @”
}> & 2
eksportuj -f @err

function @die () {
    @out „$ @”
    wyjście 1
}> & 2
export -f @die

if [[-z "$ {BASH_VERSION: -}"]] || [["$ {BASH_VERSINFO [0]}" -lt 4]]; następnie
    @die „Bach Testing Framework obsługuje tylko Bash v4 +!”
fi

if [["$ {BACH_DEBUG: -}"! = prawda]]; następnie
    function @debug () {
        :
    }
jeszcze
    exec 8> & 2
    function @debug () {
        wbudowany printf '[DEBUGOWANIE]% s \ n' "$ *"
    }> & 8
fi
export -f @debug

function bach-real-path () {
    zadeklaruj nazwę folderu = „$ 1”
    zadeklaruj altname = "$ {name # * |}"
    name = "$ {name% | *}"
    dla folderu w „$ {bach_origin_paths [@]}”; robić
        if [[-x "$ folder / $ nazwa"]]; następnie
           wbudowane echo „$ folder / $ nazwa”
           powrót 0
        elif [["$ name"! = "$ altname" && -x "$ folder / $ altname"]]; następnie
            wbudowane echo „$ folder / $ altname”
            powrót 0
        fi
    Gotowe
    powrót 1
}
export -f bach-real-path

eksportuj BACH_DEV_STDIN = ""

function bach_restore_stdin () {
    Jeśli [[ ! -t 0]]; następnie
        zadeklaruj imię
        [[-n "$ BACH_DEV_STDIN"]] || dla nazwy w / dev / ptmx / dev / pts / ptmx / dev / ttyv [0-9a-f]; robić
            if [[-r "$ nazwa" && -c "$ nazwa"]]; następnie
                ls -l "$ name"> & 2
                BACH_DEV_STDIN = "$ name"
                przerwa
            fi
        Gotowe
        exec 0 <& -
        exec 0 <"$ BACH_DEV_STDIN"
    fi
}

function bach_initialize () {
    włącz -n alias bg bind dirs disown fc fg hash help historia zadania zabij czasy zawieszenia ulimit umask unalias czekaj

    zadeklaruj nazwę narzędzia użytkowego ścieżka_użytkowa

    deklaruj -a bash_builtin_cmds = (cd echo włącz popd pushd pwd shopt testowy typ pułapki)

    na imię w. polecenie exec false set true unset "$ {bash_builtin_cmds [@]}"; robić
        eval "function @ $ {name} () {builtin $ name \" \ $ @ \ ";} 8> / dev / null; export -f @ $ {name}"
    Gotowe

    na imię w eval; robić
        eval "function @ $ {name} () {builtin $ name \" \ $ @ \ ";}; export -f @ $ {name}"
    Gotowe

    function @source () {
        zadeklaruj skrypt = "$ 1"
        Zmiana
        wbudowane źródło „$ script” „$ @”
    }

    deklaruj -a bach_core_utils = (cat chmod cut diff znajdź env grep ls "shasum | sha1sum" mkdir mktemp rm rmdir sed sort tee touch which xargs)

    do wykorzystania w „$ {bach_core_utils [@]}”; robić
        if [["$ util" == "shasum |" * && "$ BACH_OS_NAME" == FreeBSD]]; następnie
            util = "shasum | sha1"
        fi
        name = "$ {util% | *}"
        util_path = "$ (bach-real-path" $ util ")"
        eval "[[-n \" $ {ścieżka_użytkowa} \ "]] || @die \" Fatalne, NIE MOŻNA znaleźć '$ name' w \\\ $ PATH \ "; function @ $ {name} () {\ "$ {ścieżka_użytkowa} \" \ "\ $ @ \";} 8> / dev / null; export -f @ $ {name} "
    Gotowe

    @unset nazwa ścieżka_użytkowa

    bach_restore_stdin
    @mockall „$ {bash_builtin_cmds [@]}” źródło.
}

function @real () {
    zadeklaruj nazwę = "$ 1" real_cmd
    if [["$ name" == * / *]]; następnie
        @echo „$ @”
        powrót
    fi
    real_cmd = "$ (bach-real-path" $ 1 "7> & 1)"
    if [[-z "$ {real_cmd}"]]; następnie
        real_cmd = "$ {name} _not_found"
    fi
    deklaruj -a cmd = ("$ {real_cmd}" "$ {@: 2}")
    @debug "[REAL-CMD]" "$ {cmd [@]}"
    „$ {cmd [@]}”
}
export -f @real

function bach-get-all-functions () {
    zadeklarować -F
}
export -f bach-get-all-functions

function bach - skip-the-test () {
    deklaruj test = "$ 1" filtr_testowy
    podczas odczytu -d, test_filter; robić
        [[-n "$ test_filter"]] || kontyntynuj
        [["$ test" == $ test_filter]] && return 0
        [["$ test" == test- $ test_filter]] && return 0
    gotowe <<< "$ {BACH_TESTS: -},"
}
export -f bach - pomiń test

function bach-run-tests - get-all-tests () {
    bach-get-all-functions | @sort -R | podczas czytania -r _ _ nazwa; robić
        [["$ name" == test? *]] || kontyntynuj
        [["$ name" == * -assert]] && kontynuuj
        bach - pomiń test "$ name" || kontyntynuj
        printf "% s \ n" "$ name"
    Gotowe
}

dla donotpanic w donotpanic dontpanic do-not-panic dont-panic do_not_panic dont_panic; robić
    eval "function @ $ {donotpanic} () {wbudowane printf '\ n% s \ n numer linii:% s \ n stos skryptów:% s \ n \ n' 'NIE PANIKUJ!' \ "\ $ {BASH_LINENO} \" \ "\ $ {BASH_SOURCE [*]} \"; wbudowane wyjście 1;}> & 2; export -f @ $ {donotpanic}; "
Gotowe

function bach - is-function () {
    [["$ (@ type -t" $ 1 ")" == funkcja]]
}
export -f bach - is-function

deklaruj -gr __bach_run_test__ignore_prefix = "## BACH:"
function @comment () {
    @out "$ {__ bach_run_test__ignore_prefix}" "$ @"
}
eksport -f @comment

function bach-run-tests () {
    ustaw -euo pipefail

    bach_initialize

    dla donotpanic w donotpanic dontpanic do-not-panic dont-panic do_not_panic dont_panic; robić
        eval "function @ $ {donotpanic} () {builtin true;}; export -f @ $ {donotpanic}"
    Gotowe

    function command () {
        if bach - jest funkcją "$ 1"; następnie
            „$ @”
        jeszcze
            command_not_found_handle polecenie „$ @”
        fi
    }
    polecenie eksportu -f

    function xargs () {
        zadeklaruj param
        zadeklaruj -a xargs_opts
        while param = "$ {1: -}"; [[-n "$ {param: -}"]]; robić
            shift || prawdziwe
            if [["$ param" == "-"]]; następnie
                xargs_opts + = ("$ {BASH: -bash}" "-c" "$ (printf" '% s' "" $ @ ") \ $ @" "-s")
                przerwa
            jeszcze
                xargs_opts + = ("$ param")
            fi
        Gotowe
        @debug "@ mock-xargs" "$ {xargs_opts [@]}"
        if [["$ #" -gt 0]]; następnie
            @xargs "$ {xargs_opts [@]}"
        jeszcze
            [[-t 0]] || @cat &> / dev / null
            @dryrun xargs "$ {xargs_opts [@]}"
        fi
    }
    eksport -f xargs

    jeśli [["$ {BACH_ASSERT_IGNORE_COMMENT}" == prawda]]; następnie
        BACH_ASSERT_DIFF_OPTS + = (- I "^ $ {__ bach_run_test__ignore_prefix}")
    fi

    zadeklaruj color_ok color_err color_end
    if [["$ BACH_COLOR" == "zawsze"]] || [["$ BACH_COLOR"! = "Nie" && -t 1 && -t 2]]; następnie
        color_ok = "\ e [1; 32m"
        color_err = "\ e [1; 31m"
        color_end = "\ e [0; m"
    jeszcze
        color_ok = ""
        color_err = ""
        color_end = ""
    fi
    zadeklaruj nazwę przyjazna_nazwa testresult test_name_assert_fail
    deklaruj -i total = 0 błędów = 0
    zadeklaruj -a all_tests
    mapfile -t all_tests <<(bach-run-tests - get-all-tests)
    @echo "1 .. $ {# all_tests [@]}"
    dla nazwy w „$ {all_tests [@]}”; robić
        # @debug "Trwa test: $ name"
        friendly_name = "$ {name / # test- /}"
        friendly_name = "$ {friendly_name // - /}"
        friendly_name = "$ {friendly_name // / -}"
        : $ ((++ łącznie))
        testresult = "$ (@ mktemp)"
        @set + e
        assert-Execution "$ name" &> "$ testresult"; test_retval = "$?"
        @set -e
        if [["$ nazwa" == test-ASSERT-FAIL- *]]; następnie
            test_retval = "$ ((test_retval == 0? 1: 0))"
            test_name_assert_fail = "$ {color_err} ASSERT FAIL $ {color_end}"
            friendly_name = "$ {friendly_name / # ASSERT FAIL /}"
        jeszcze
            test_name_assert_fail = ""
        fi
        if [["$ test_retval" -eq 0]]; następnie
            printf "$ {color_ok} ok% d - $ {test_name_assert_fail} $ {color_ok}% s $ {color_end} \ n" "$ total" "$ friendly_name"
        jeszcze
            : $ ((błąd ++))
            printf "$ {color_err} nie ok% d - $ {test_name_assert_fail} $ {color_err}% s $ {color_end} \ n" "$ total" "$ friendly_name"
            {
                printf "\ n"
                @cat "$ testresult"> & 2
                printf "\ n"
            }> & 2
        fi
        @rm "$ testresult" &> / dev / null
    Gotowe

    deklaruj color_result = "$ color_ok"
    if ((błąd> 0)); następnie
        color_result = "$ color_err"
    fi
    printf - "# ----- \ n # $ {color_result} Wszystkie testy:% s, nie powiodło się:% d, pominięto:% d $ {color_end} \ n" \
           "$ {# all_tests [@]}" "$ błąd" "$ (($ {# all_tests [@]} - łącznie))"> & 2
    [["$ błąd" == 0]] && [["$ {# all_tests [@]}" -eq "$ łącznie"]]
}

function bach-on-exit () {
    if [[-o xtrace]]; następnie
        exec 8> & 2
        BASH_XTRACEFD = 8
    fi
    jeśli [["$?" -eq 0]]; następnie
        [["$ {BACH_DISABLED: -false}" == prawda]] || bach-run-testy
    jeszcze
        printf "Wyskakuj!% s \ n" "Nie można zainicjować testów."
    fi
}

pułapka bach-on-exit EXIT

function @generate_mock_function_name () {
    zadeklaruj nazwę = "$ 1"
    @echo "mock_exec _ $ {name} _ $ (@ dryrun" $ {@} "| @shasum | @cut -b1-7)"
}
export -f @generate_mock_function_name

function @mock () {
    zadeklaruj -a nazwa parametru cmd func body desttype
    name = "$ 1"
    if [["$ nazwa" == @ (wbudowane | zadeklaruj | eval | printf | set | unset | true | false | while | read)]]; następnie
        @die „Nie można mockować wbudowanego polecenia: $ name”
    fi
    if [[polecenie == "$ nazwa"]]; następnie
        Zmiana
        name = "$ 1"
    fi
    desttype = "$ (@ type -t" $ name "|| true)"
    dla param; robić
        if [["$ param" == '===']]; następnie
            Zmiana
            przerwa
        fi
        cmd + = ("$ param")
    Gotowe
    shift „$ {# cmd [@]}”
    if [["$ name" == / *]]; następnie
        @die „Nie można udawać ścieżki bezwzględnej: $ name”
    elif [["$ nazwa" == * / *]] && [[-e "$ nazwa"]]; następnie
        @die „Nie można udawać, że istnieje ścieżka: $ name”
    fi
    @debug "@mock $ name"
    if [["$ #" -gt 0]]; następnie
        @debug "@mock $ name $ *"
        zadeklaruj -a params = ("$ @")
        func = "$ (deklaruj parametry -p); \" \ $ {parametry [@]} \ ""
        #func = „$ *”
    elif [[! -t 0]]; następnie
        @debug "@mock $ name @cat"
        func = "$ (@ cat)"
    fi
    if [[-z "$ {func: -}"]]; następnie
        @debug "@mock default $ name"
        func = "if [[-t 0]]; then @dryrun \" $ {name} \ "\" \ $ @ \ "> & 7; else @cat; fi"
    fi
    if [["$ name" == * / *]]; następnie
        [[-d "$ {name% / *}"]] || @mkdir -p "$ {name% / *}"
        @cat> "$ name" << SCRIPT
#! $ {BASH: - / bin / bash}
$ {func}
SCENARIUSZ
        @chmod + x "$ name"> & 2
    jeszcze
        if [[-z "$ desttype" || "$ desttype" == builtin]]; następnie
            eval "function $ {name} () {
                      deklaruj mockfunc = \ "\ $ (@ generated_mock_function_name $ {name} \" \ $ {@} \ ") \"
                      jeśli bach - jest-funkcją \ "\ $ mockfunc \"; następnie
                           \ "\ $ {mockfunc} \" \ "\ $ @ \"
                      jeszcze
                           [[-t 0]] || @kot
                           @dryrun $ {name} \ "\ $ @ \"> & 7
                      fi
                  }; export -f $ {name} "
        fi
        zadeklaruj mockfunc
        mockfunc = "$ (@ generated_mock_function_name" $ ​​{cmd [@]} ")"
        #stderr name = "$ name"
        # body = "function $ {mockfunc} () {@debug Uruchamianie makiety: '$ {cmd [*]}':; $ func;}"
        deklaruj mockfunc_seq = "$ {mockfunc // @ / __} _ SEQ"
        mockfunc_seq = "$ {mockfunc_seq // - / __}"
        body = "function $ {mockfunc} () {
            zadeklaruj -gxi $ {mockfunc_seq} = \ "\ $ {$ {mockfunc_seq}: - 0} \";
            if bach - to-funkcja \ "$ {mockfunc} _ \ $ (($ {mockfunc_seq} + 1)) \"; następnie
                let ++ $ {mockfunc_seq};
            fi;
            \ "$ {mockfunc} _ \ $ {$ {mockfunc_seq}} \" \ "\ $ @ \";
        }; export -f $ {mockfunc} "
        @debug „$ body”
        eval „$ body”
        for ((mockfunc__SEQ = 1; mockfunc__SEQ <= $ {BACH_MOCK_FUNCTION_MAX_COUNT: -0}; ++ mockfunc__SEQ)); robić
            bach - is-function "$ {mockfunc} _ $ {mockfunc__SEQ}" || przerwa
        Gotowe
        body = "$ {mockfunc} _ $ {mockfunc__SEQ} () {
            # @mock $ {name} $ {cmd [@]} ===
            $ func
        }; export -f $ {mockfunc} _ $ {mockfunc__SEQ} "
        @debug „$ body”
        eval „$ body”
    fi
}
export -f @ makieta

function @@ mock () {
    BACH_MOCK_FUNCTION_MAX_COUNT = 15 @ makieta "$ @"
}
eksport -f @@ mock

function @mocktrue () {
    @mock "$ @" === @true
}
export -f @mocktrue

function @mockfalse () {
    @mock "$ @" === @false
}
export -f @mockfalse

function @mockall () {
    zadeklaruj imię
    na imię; robić
        @mock „$ name”
    Gotowe
}
export -f @mockall


BACH_FRAMEWORK__SETUP_FUNCNAME = "_ bach_framework_setup_"
alias @ setup = "funkcja $ BACH_FRAMEWORK__SETUP_FUNCNAME"

BACH_FRAMEWORK__PRE_TEST_FUNCNAME = '_ bach_framework_pre_test_'
alias @ setup-test = "funkcja $ BACH_FRAMEWORK__PRE_TEST_FUNCNAME"

BACH_FRAMEWORK__PRE_ASSERT_FUNCNAME = '_ bach_framework_pre_assert_'
alias @ setup-assert = "funkcja $ BACH_FRAMEWORK__PRE_ASSERT_FUNCNAME"

function _bach_framework__run_function () {
    zadeklaruj nazwę = "$ 1"
    if bach - jest funkcją "$ nazwa"; następnie
        „$ name”
    fi
}
export -f _bach_framework__run_function

function @dryrun () {
    builtin deklaruje parametr
    [["$ #" -le 1]] || wbudowany parametr printf -v '% s' "$ {@: 2}"
    wbudowane echo „$ {1} $ {param: -}”
}
export -f @dryrun

zadeklaruj -gxa BACH_ASSERT_DIFF_OPTS = (- u)
deklaruj -gx BACH_ASSERT_IGNORE_COMMENT = "$ {BACH_ASSERT_IGNORE_COMMENT: -true}"
deklaruj -gx BACH_ASSERT_DIFF = "$ {BACH_ASSERT_DIFF: -diff}"

funkcja assert-wykonanie () (
    @unset BACH_TESTS
    deklaruj bach_test_name = "$ 1" bach_tmpdir bach_actual_output bach_expected_output
    bach_tmpdir = "$ (@ mktemp -d)"
    #trap '/ bin / rm -vrf "$ bach_tmpdir"' RETURN
    @mkdir "$ {bach_tmpdir} / test_root"
    @pushd "$ {bach_tmpdir} / test_root" &> / dev / null
    zadeklaruj retval = 1

    exec 7> & 2

    function command_not_found_handle () {
        zadeklaruj mockfunc bach_cmd_name = "$ 1"
        [[-n "$ bach_cmd_name"]] || @out „Błąd: Bach znalazł puste polecenie w wierszu $ {BASH_LINENO}”. > & 7
        mockfunc = "$ (@ generated_mock_function_name" $ ​​@ ")"
        # @debug "mockid = $ mockid"> & 2
        if bach - jest-funkcją "$ {mockfunc}"; następnie
            @debug "[CNFH-func]" "$ {mockfunc}" "$ @"
            „$ {mockfunc}” „$ @”
        elif [["$ {bach_cmd_name}" == @ (cd | polecenie | echo | eval | exec | false | popd | pushd | pwd | source | true | type)]]; następnie
            @debug "[wbudowany CNFH]" "$ @"
            wbudowany „$ @”
        jeszcze
            @debug "[CNFH-default]" "$ @"
            @dryrun "$ @"
        fi
    }> & 7 # 8> / dev / null
    export -f command_not_found_handle

    function __bach__pre_run_test_and_assert () {
        @trap - EXIT RETURN
        @set + euo pipefail
        zadeklaruj -gxr PATH = bach-fake-path
        bach_restore_stdin
        _bach_framework__run_function "$ BACH_FRAMEWORK__SETUP_FUNCNAME"
    }
    function __bach__run_test () (
        __bach__pre_run_test_and_assert
        _bach_framework__run_function "$ {BACH_FRAMEWORK__PRE_TEST_FUNCNAME}"
        „$ {1}”
    ) 7> & 1

    function __bach__run_assert () (
        @unset -f @mock @mockall @ignore @ setup-test
        __bach__pre_run_test_and_assert
        _bach_framework__run_function "$ {BACH_FRAMEWORK__PRE_ASSERT_FUNCNAME}"
        „$ {1} -assert”
    ) 7> & 1
    bach_actual_stdout = "$ {bach_tmpdir} /actual-stdout.txt"
    bach_expected_stdout = "$ {bach_tmpdir} /expected-stdout.txt"
    if bach - is-function "$ {bach_test_name} -assert"; następnie
        @cat <(
            __bach__run_test "$ bach_test_name"
            @echo "# Kod zakończenia: $?"
        )> „$ {bach_actual_stdout}”
        @cat <(
            __bach__run_assert "$ bach_test_name"
            @echo "# Kod zakończenia: $?"
        )> „$ {bach_expected_stdout}”
        @Płyta CD ..
        if @real "$ {BACH_ASSERT_DIFF}" "$ {BACH_ASSERT_DIFF_OPTS [@]}" - \
            „$ {bach_actual_stdout ## * /}” „$ {bach_expected_stdout ## * /}”
        następnie
            retval = 0
        fi
    jeszcze
        __bach__run_test "$ bach_test_name" |
            @tee / dev / stderr | @grep "^ $ {__ bach_run_test__ignore_prefix} \\ [assert-"> / dev / null
        retval = "$?"
    fi
    @popd &> / dev / null
    @rm -rf "$ bach_tmpdir"
    zwraca „$ retval”
)

function @ignore () {
    zadeklaruj nazwę = "$ 1"
    eval "function $ {name} () {
              deklaruj mockfunc = \ "\ $ (@ generuj_mock_nazwa_funkcji $ {nazwa} \" \ $ {@} \ ") \";
              jeśli bach - jest-funkcją \ "\ $ mockfunc \"; następnie
                  \ "\ $ {mockfunc} \" \ "\ $ @ \";
              else [[-t 0]] || @kot; fi
          }; export -f $ {name} "
}
export -f @ignore

function @stderr () {
    printf "% s \ n" "$ @"> & 2
}
export -f @stderr

function @stdout () {
    printf "% s \ n" "$ @"
}
export -f @stdout

function @load_function () {
    plik lokalny = "$ {1:? nazwa pliku skryptu}"
    local func = "$ {2:? nazwa funkcji}"
    @source <(@ sed -Ene "/ ^ function [[: space:]] + $ {func} ([\ (\ {\ [[: space:]] | [[: space:]] * \ $) /, / ^} \ $ / p "" $ plik ")
} 8> / dev / null
export -f @load_function

export BACH_STARTUP_PWD = "$ {PWD: - $ (pwd)}"
function @run () {
    deklaruj skrypt = "$ {1:? brak nazwy skryptu}"
    Zmiana
    [["$ script" == / *]] || script = "$ {BACH_STARTUP_PWD} / $ {script}"
    @source "$ script" "$ @"
}
eksport -f @run

function @fail () {
    zadeklaruj retval = 1
    if [["$ {1: -}" = ~ ^ [0-9] + $]]; następnie
        retval = "1 $"
        Zmiana
    fi
    if [["$ #" -gt 0]]; następnie
        @out „$ {@}”
    fi
    wbudowane wyjście „$ {retval}”
}
export -f @fail

function @ assert-equals () {
    deklaruj oczekiwano = "$ {1:? brakuje oczekiwanego wyniku}" rzeczywiste = "$ {2:? brakuje rzeczywistego wyniku}"

    if [["$ {oczekiwano}" == "$ {faktyczna}"]]; następnie
        @out << EOF
Oczekiwano $ {__ bach_run_test__ignore_prefix} [assert-equals]: $ {oczekiwano}
## rzeczywista: $ {rzeczywista}
EOF
    jeszcze
        @die - 2> & 7 << EOF
Assert Failed:
     Oczekiwano: oczekiwano $
      Ale dostałem: $ rzeczywiste
EOF
    fi
}> & 7
export -f @ assert-equals

function @ assert-fail () {
    zadeklaruj oczekiwano = "<niezerowe>" rzeczywiste = "$?"
    [["$ rzeczywisty" -eq 0]] || oczekiwano = „$ rzeczywiste”
    @ assert-equals "$ oczekiwane" "$ rzeczywiste"
}
export -f @ assert-fail

function @ assert-success () {
    zadeklaruj oczekiwano = 0 rzeczywiste = "$?"
    @ assert-equals "$ oczekiwane" "$ rzeczywiste"
}
export -f @ assert-success

function @ do-nic () {
    :
}
eksportuj -f @ nie rób nic

function @unmock () {
    zadeklaruj nazwę = "$ {1:? brakująca nazwa polecenia}"
    if bach - jest funkcją "$ nazwa"; następnie
        unset -f "$ name"
    fi
}
export -f @unmock