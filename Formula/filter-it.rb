require 'formula'

class FilterIt < Formula
  homepage 'http://silicos-it.be.s3-website-eu-west-1.amazonaws.com/software/filter-it/1.0.2/filter-it.html'
  url 'http://silicos-it.be.s3-website-eu-west-1.amazonaws.com/_downloads/filter-it-1.0.2.tar.gz'
  mirror 'http://assets.matt-swain.com/homebrew/filter-it-1.0.2.tar.gz'
  sha256 '386a94f092a1721351afac22f419fa5944c385a1908d6e6ec8b901764913efe0'

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
    system "#{bin}/filter-it -h"
  end
end
