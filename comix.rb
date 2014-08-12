require "formula"

class Comix < Formula
  homepage "http://comix.sourceforge.net/"
  url 'http://downloads.sourceforge.net/project/comix/comix/comix-4.0.4/comix-4.0.4.tar.gz'
  sha1 "a707cbd88efda85ee0263fd38ba6bca97eee402c"

  depends_on "unrar"
  depends_on "pygtk"
  depends_on "homebrew/python/pillow"
  depends_on "gtk-engines"
  depends_on "hicolor-icon-theme"

  def install
    %x[sed -i "" "1s|.*|\#!/usr/bin/env GTK_EXE_PREFIX=#{HOMEBREW_PREFIX} PYTHONPATH=#{HOMEBREW_PREFIX}/lib/python2.7/site-packages python|" src/comix.py] 
    %x[sed -i "" "s|import Image|from PIL import Image|g" `grep -rl "import Image" .`]
    system "python", "install.py",
                     "--dir",
                     "#{prefix}",
                     "--no-mime",
                     "install"
  end
end
