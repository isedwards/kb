### Reserved Instances

[Reserved instances are just a billing feature](http://serverfault.com/a/759616). If you have paid for reserved instances then you are billed less for the equivalent EC2 instances that you are running.

- A **standard** RI fixes instance type family (like T2), a reservation plan (all upfront, partial upfront, no upfront), operating system (Linux), and tenancy (like shared/dedicated). You can modify the instance type to make it large (e.g. `t2.micro` to `t2.small`).  You can also merge two smaller RIs to a large one. At the time of writing, `t2.micro` instances are considered to be worth "0.5 units". You can combine two `t2.micro` into a single (1 unit) `t2.small`, or combine four `t2.mirco` into a single (2 unit) `t2.medium`.

- A **convertible** RI costs a bit more, but also alows you to change other aspects like the instance type family.
