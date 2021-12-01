class Asl < Formula
  desc "AS is a portable macro cross assembler for many microprocessors and -controllers"
  homepage "http://john.ccac.rwth-aachen.de:8000/as/"
  url "http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/asl-current.tar.bz2"
  version "current"
  license ""
  revision 1

  def install
    cp "Makefile.def-samples/Makefile.def-x86_64-osx", "Makefile.def"
    system "make"
    bin.install "asl", "plist", "alink", "pbind", "p2hex", "p2bin"
    include.install Dir["include/*"]
    lib.install "alink.msg", "as.msg", "cmdarg.msg", "ioerrs.msg", "p2bin.msg", "p2hex.msg"
    lib.install "pbind.msg", "plist.msg", "tools.msg"
    man1.install Dir["man/*.1"]
  end

  test do
    system "make", "test"
  end
end
