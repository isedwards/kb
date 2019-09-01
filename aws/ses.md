## Syncing with time server

If you get an error message like the following in your `logs/django_site.log`:

    BotoServerError: BotoServerError: 400 Bad Request
    <ErrorResponse xmlns="http://ses.amazonaws.com/doc/2010-12-01/">
      <Error>
        <Type>Sender</Type>
        <Code>RequestExpired</Code>
        <Message>Request timestamp: Tue, 10 Apr 2018 08:38:31 GMT expired.  It must be within 300 secs/ of server time.</Message>
      </Error>
    </ErrorResponse>

Setup the AWS [time sync service](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html) (see "To configure your Ubuntu or Debian derivative instance to use the Amazon Time Sync Service"). E.g. `sudo apt install chrony` ([chrony](https://chrony.tuxfamily.org)) and don't forget to `sudo reboot`.

It looks like chrony only syncs server time on boot. When you have a virtual machine open a long time on a computer that has been hibernated etc. then the time possibly drifts and causes problems.

On our webapps systems, the legacy way to send email using SES is along the lines of:

    from projectname.ses import Email
    email = Email(to='to@address.com', subject='boto test')
    email.text('testing sending email using boto, see logs for failures')
    email.send(from_addr='from@address.com')
