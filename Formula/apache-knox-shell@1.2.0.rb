class ApacheKnoxShellAT120 < Formula
  desc "Apache Knox Shell"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/1.2.0/knoxshell-1.2.0.tar.gz"
  version "1.2.0"
  sha256 "e1d02f0e394b40ae1fea29110248a0af36aa4afa7a1ceb54830e5c607f3a729a"

  depends_on "openjdk@8"

  def install
    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]

    # Some binaries have really generic names (like `test`) and most seem to be
    # too special-purpose to be permanently available via PATH.
    #%w[gateway.sh ldap.sh].each do |script|
    #  (bin/script).write_env_script "#{libexec}/bin/#{script}", Language::Java.java_home_env("1.8")
    #end
  end

  test do
    system "true"
  end
end
