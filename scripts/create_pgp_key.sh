if gpg --list-keys | grep -q $1; then
    gpg --export $1 | base64
else
    gpg --batch --gen-key $2/gen-key && gpg --export $1 | base64
fi