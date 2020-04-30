

function sdk --description 'Software Development Kit Manager'
  set after_env (mktemp -t envXXXXX)
  set path_env (mktemp -t envXXXXX)

    bash -c "source ~/.sdkman/bin/sdkman-init.sh && sdk $argv && printenv > $after_env"

    # remove any pre-existing .sdkman paths
    for elem in $PATH
      switch $elem
        case '*/.sdkman/*'
          # ignore
        case '*'
          echo "$elem" >> $path_env
      end
    end

    for env in (cat $after_env)
      set env_name (echo $env | sed s/=.\*//)
      set env_value (echo $env | sed s/.\*=//)
      switch $env_name
        case 'PATH'
          for elem in (echo $env_value | tr ':' '\n')
            switch $elem
              case '*/.sdkman/*'
                echo "$elem" >> $path_env
            end
          end
        case '*'
          if test $env_name = "JAVA_HOME" -a (set -q JAVA_HOME; echo $status) -eq 0 -a (set -q CUSTOM_JAVA_HOME; echo $status) -eq 0
             echo "NOTE: not overwriting JAVA_HOME($JAVA_HOME)"
          else
              switch $env_value
                case '*/.sdkman/*'
                  eval set -g $env_name $env_value > /dev/null
              end
          end
      end
    end
    set -gx PATH (cat $path_env) ^ /dev/null

    command rm -f $after_env
    command rm -f $path_env
    set -gx SDKMAN_INITIALIZED 1
end
