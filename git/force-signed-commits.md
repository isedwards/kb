`.git/hooks/pre-commit`

```bash
#!/bin/bash
# GPG signing enforcement
# Prevent unsigned commits
if ! git config --get user.signingkey >/dev/null 2>&1; then
    echo "Error: No GPG signing key configured"
    echo "  Set up GPG signing or use 'git commit -S'"
    exit 1
fi

if ! git config --get commit.gpgsign >/dev/null 2>&1 || [ "$(git config --get commit.gpgsign)" != "true" ]; then
    echo "Error: GPG signing not enabled"  
    echo "  Run 'git config commit.gpgsign true' or use 'git commit -S'"
    exit 1
fi
```

```
