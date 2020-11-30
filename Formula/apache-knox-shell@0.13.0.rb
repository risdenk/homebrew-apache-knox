class ApacheKnoxShellAT0130 < Formula
  desc "Apache Knox Shell"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.13.0/knoxshell-0.13.0.tar.gz"
  version "0.13.0"
  sha256 "33fcf6ab4fbf81c703fb5b96144b54cb8ceb48cbf9aab1a278915ade8dc4a0d2"

  bottle :unneeded

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
