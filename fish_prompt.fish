function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
	set -g __fish_prompt_char '#'
      case '*'
	set -g __fish_prompt_char '>'
    end
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l cyan (set_color cyan)
  set -l white (set_color white)
  set -l green (set_color green)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color green
  set -g __fish_git_prompt_color_flags green
  set -g __fish_git_prompt_color_prefix red
  set -g __fish_git_prompt_color_suffix red
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true
  
  # Line 1
  echo -n $red'-['$white$USER$red'@'$white$__fish_prompt_hostname$red']'$white'-'$red'('$white(prompt_pwd)$red')'
  __fish_git_prompt "-[: %s]"
  echo -n $red-$__fish_prompt_char $normal
end
