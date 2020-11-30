class ApacheKnoxAT091 < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.9.1/knox-0.9.1.tar.gz"
  version "0.9.1"
  sha256 "5ee3a2184352801beb0aab05a19ca7b03eaa3b50e58356e35718ccc24396c98a"

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
