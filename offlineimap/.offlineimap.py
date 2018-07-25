import subprocess
import sys

def mailpasswd(acct):
  '''
  Decrypt passwords with gpg
  '''
  path = "/home/taha/.passwd/%s.gpg" % acct
  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
  try:
    return subprocess.check_output(args).strip()
  except subprocess.CalledProcessError:
    return ""

if __name__ == "__main__":
    print(mailpasswd(sys.argv[1]).decode('utf-8'))
