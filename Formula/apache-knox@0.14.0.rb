class ApacheKnoxAT0140 < Formula
  desc "Apache Knox"
  homepage "https://knox.apache.org"
  url "https://archive.apache.org/dist/knox/0.14.0/knox-0.14.0.tar.gz"
  version "0.14.0"
  sha256 "22d4dbd3dbd23d2eddb86530d6545ea71d223845920bd9d42c3b5f823d064692"

  bottle :unneeded

  depends_on :java => "1.8"

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
