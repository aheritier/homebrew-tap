class Jbang < Formula
    desc "Unleash the power of Java for shell scripting"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.21.0/jbang-0.21.0.zip"
    sha256 "96af84b17ac9b2b1d79fa8e716371dc34d16efe0cf8fe35ee0e140c964e52c0e"

    bottle :unneeded

    keg_only :versioned_formula

    #depends_on cask:"java"
    depends_on :java => "1.8+"

    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end

    test do
        system "#{bin}/jbang", "--init=cli", "hello.java"
        system "#{bin}/jbang", "hello.java", "Homebrew!"
    end
  end