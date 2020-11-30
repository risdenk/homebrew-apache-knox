class ApacheKnoxShellAT100 < Formula
  desc "Apache Knox Shell"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/1.0.0/knoxshell-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "4d0018a258504fdf0e78ec2a45074780e865041a7f624f0b301d5897e035067d"

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
