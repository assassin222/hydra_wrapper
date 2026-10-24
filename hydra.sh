
#!/usr/bin/env bash

if [[ -t 1 ]]; then
  RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
else
  RED=''; GREEN=''; YELLOW=''; NC=''
fi

die() { echo -e "${RED}[!] $*${NC}" >&2; exit 1; }
info() { echo -e "${YELLOW}[>] $*${NC}"; }

command -v hydra >/dev/null 2>&1 || die "hydra not found. Install it with: sudo apt install hydra"

info "=== Hydra Interactive Wrapper ==="

# Target
read -r -p "[?] Target IP/hostname : " TARGET
[[ -n "$TARGET" ]] || die "No target given."

# Port (optional)
read -r -p "[?] Port (Enter = auto-detect) : " PORT

# Username: single user or list
while true; do
  read -r -p "[?] Single user (-l) or user list (-L) ? [l/L] : " UCHOICE
  [[ "$UCHOICE" == "l" || "$UCHOICE" == "L" ]] && break
  echo "  -> type 'l' or 'L'"
done

if [[ "$UCHOICE" == "l" ]]; then
  read -r -p "[?] Username : " USER
  [[ -n "$USER" ]] || die "Username empty."
else
  read -r -p "[?] Userlist path : " USERLIST
  [[ -f "$USERLIST" ]] || die "File not found: $USERLIST"
fi

# Password: single password or list
while true; do
  read -r -p "[?] Single password (-p) or password list (-P) ? [p/P] : " PCHOICE
  [[ "$PCHOICE" == "p" || "$PCHOICE" == "P" ]] && break
  echo "  -> type 'p' or 'P'"
done

if [[ "$PCHOICE" == "p" ]]; then
  read -r -p "[?] Password : " PASS
else
  read -r -p "[?] Password list path : " PASSLIST
  [[ -f "$PASSLIST" ]] || die "File not found: $PASSLIST"
fi

# Service
read -r -p "[?] Service (ssh, ftp, rdp, smb, http-post-form...) : " SERVICE
[[ -n "$SERVICE" ]] || die "No service given."

# Extra arguments
read -r -p "[?] Extra hydra args (e.g. -t 16 -f -V) or Enter to skip : " EXTRA

# Build the command
CMD="hydra"
[[ -n "$PORT" ]] && CMD+=" -s $PORT"
[[ "$UCHOICE" == "l" ]] && CMD+=" -l $USER" || CMD+=" -L $USERLIST"
[[ "$PCHOICE" == "p" ]] && CMD+=" -p $PASS" || CMD+=" -P $PASSLIST"
CMD+=" $SERVICE://$TARGET"
[[ -n "$EXTRA" ]] && CMD+=" $EXTRA"

info "Running: $CMD"
echo -e "${GREEN}Press Enter to start, Ctrl+C to abort.${NC}"
read -r

# Run it
eval "$CMD"
STATUS=$?
echo -e "${GREEN}[+] Done. Exit status: $STATUS${NC}"
