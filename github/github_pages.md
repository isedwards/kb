### Setting up a primary domain (not a subdomain) with https

1. Set up four `A` records with `@` pointing to:
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153
2. Add `CNAME` with `www` pointing to `username.github.io`
3. Wait for DNS to update (from 25 minutes to 24 hours)
4. Add domain **without www** to the settings section for github pages in the repository (github will add a commit with a new `CNAME` file)
5. After a few minutes you'll be able to also select the 'force https' box.

Using just a `CNAME` record causes `www.example.com` to be redirected to `example.com`. Another option may be to repeat step one above with four `A` records with `www` also pointing to the IP addresses shown.

Notes:
- If the certificate is issues for the domain name without `www` then it's possible both varations will work, otherwise people advocate requesting certs both with and without `www`, GitHub is then able to serve both
- When adding the `CNAME` record to the DNS you only need to add `username.github.io` and not `username.github.io/repository` - GitHub will work it all out
- Don't use `*.domain` in your DNS to setup GitHub pages sites otherwise other people could host content at an arbitary subdomain

