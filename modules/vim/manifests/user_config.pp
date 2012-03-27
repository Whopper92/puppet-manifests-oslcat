# $title is the name of the user this config should exist for
define vim::user_config ($home="/home/${title}") {
  @util::user_config_dir {
    "vim_dir":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim";
    "vim_ftdetect_dir":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim/ftdetect";
    "vim_syntax_dir":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim/syntax";
    "vim_autoload_dir":
      app => "vim",
      user => "${title}",
      path => "${home}/.vim/autoload";
  }

  @util::user_config_file {
    "vimrc":
      app      => "vim",
      user     => "${title}",
      path     => "${home}/.vimrc",
      template => ["vim/${title}/vimrc.erb", "vim/vimrc.erb"];
    "vim-zsh":
      app      => "zsh",
      user     => "${title}",
      path     => "${home}/.zshrc.d/vim",
      template => "vim/vim_zshrc.erb";
  }
}