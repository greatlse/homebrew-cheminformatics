require 'formula'

class ShapeIt < Formula
  homepage 'http://silicos-it.be.s3-website-eu-west-1.amazonaws.com/software/shape-it/1.0.1/shape-it.html'
  url 'http://silicos-it.be.s3-website-eu-west-1.amazonaws.com/_downloads/shape-it-1.0.1.tar.gz'
  mirror 'http://assets.matt-swain.com/homebrew/shape-it-1.0.1.tar.gz'
  sha1 '584dac228c10d1bd07b4ffd2cbac0efb5024025e'

  bottle do
    root_url "http://assets.matt-swain.com/homebrew"
    cellar :any
    sha1 "eea2a2101b78fddd475ac4f3b1b9fee857fff407" => :mavericks
    sha1 "05b992c6e74433a1b3fbb00e41f4f2f1dfbaeaa8" => :yosemite
  end

  depends_on 'cmake' => :build
  depends_on 'mcs07/cheminformatics/open-babel'

  def install
    args = std_cmake_args
    args << "-DOPENBABEL2_INCLUDE_DIRS=#{HOMEBREW_PREFIX}/include/openbabel-2.0"
    args << "-DOPENBABEL2_LIBRARIES=#{HOMEBREW_PREFIX}/lib/libopenbabel.dylib"
    mkdir 'build' do
      system "cmake", '..', *args
      system "make"
      system "make install"
    end
  end

  test do
    system "#{bin}/shape-it -h"
  end
end
