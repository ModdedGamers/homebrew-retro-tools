class Gkermit < Formula
  desc "G-Kermit is a Unix program for transferring files with the Kermit protocol"
  homepage "https://www.kermitproject.org/gkermit.html"
  url "https://www.kermitproject.org/ftp/kermit/archives/gku200.tar.gz"
  sha256 "3ee95b7b08e2633ff277b541caf053a32b3b4bdcc160a0d319bdf5e60571da68"
  license "GPL-2.0-only"
  version "2.0"

  patch :DATA

  def install
    ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/usr/include"
    system "make", "posix", "SDKROOT=#{MacOS.sdk_path}"
    bin.install "gkermit"
  end

  test do
    system "true"
  end
end

# We need gkermit to find the malloc library, which for whatever reason
# is in its own malloc/ subdirectory of usr/include in the SDKROOT
__END__
diff --git a/gkermit.h b/gkermit.h
index 65e9a8c..d63c098 100644
--- a/gkermit.h
+++ b/gkermit.h
@@ -35,7 +35,7 @@
 
 #include <stdio.h>
 #include <errno.h>                      /* Added in G-Kermit 2.0 */
-#include <malloc.h>                     /* Added in G-Kermit 2.0 */
+#include <malloc/malloc.h>              /* Added in G-Kermit 2.0 */
 #include <string.h>                     /* Added in G-Kermit 2.0 */
 #include <stdlib.h>                     /* Added in G-Kermit 2.0 */
 

