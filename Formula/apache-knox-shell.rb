class ApacheKnoxShell < Formula
  desc "Apache Knox Shell"
  homepage "https://knox.apache.org"
  url "https://www.apache.org/dyn/closer.lua?path=knox/1.4.0/knoxshell-1.4.0.tar.gz"
  mirror "https://archive.apache.org/dist/knox/1.4.0/knoxshell-1.4.0.tar.gz"
  version "1.4.0"
  sha256 "365b615ee3c3eb475e1a7860978fcd24e3e4d431aa6d417f61cee5a84d7abff2"

  head do
    url "https://github.com/apache/knox.git"
    depends_on "maven" => :build
  end

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    if build.head?
      system "mvn", "clean", "package", "-pl", "gateway-shell-release", "-am", "-DskipTests", "-Ppackage,release"
      (buildpath/"target/binaries").mkpath
      system "tar", "xzf", Dir["target/*-SNAPSHOT/knoxshell-*-SNAPSHOT.tar.gz"].first, "-C", "target/binaries"
      rm_f Dir["target/binaries/knoxshell-*-SNAPSHOT/bin/*.cmd"]
      libexec.install Dir["target/binaries/knoxshell-*-SNAPSHOT/*"]
    else
      rm_f Dir["bin/*.cmd"]
      libexec.install Dir["*"]

      # Some binaries have really generic names (like `test`) and most seem to be
      # too special-purpose to be permanently available via PATH.
      #%w[gateway.sh ldap.sh].each do |script|
      #  (bin/script).write_env_script "#{libexec}/bin/#{script}", Language::Java.java_home_env("1.8")
      #end
    end
  end

  test do
    system "true"
  end
end
