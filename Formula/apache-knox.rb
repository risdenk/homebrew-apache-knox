class ApacheKnox < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://www.apache.org/dyn/closer.lua?path=knox/1.3.0/knox-1.3.0.tar.gz"
  mirror "https://archive.apache.org/dist/knox/1.3.0/knox-1.3.0.tar.gz"
  version "1.3.0"
  sha256 "476e1267c3faee711a6b77b26267d9368e328621ba8ac81869c5e32ec136beb4"

  head do
    url "https://github.com/apache/knox.git"
    depends_on "maven" => :build
  end

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    if build.head?
      system "mvn", "clean", "package", "-pl", "gateway-release", "-am", "-DskipTests", "-Ppackage,release"
      (buildpath/"target/binaries").mkpath
      system "tar", "xzf", Dir["target/*-SNAPSHOT/knox-*-SNAPSHOT.tar.gz"].first, "-C", "target/binaries"
      rm_f Dir["target/binaries/knox-*-SNAPSHOT/bin/*.cmd"]
      libexec.install Dir["target/binaries/knox-*-SNAPSHOT/*"]
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
