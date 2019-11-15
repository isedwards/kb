`Registering a variable and using echo <https://github.com/ansible/ansible/issues/4317#issuecomment-25463761>`_

- `Human readable output <https://stackoverflow.com/a/45086602/>`_


`Try out <https://stackoverflow.com/a/43403229/1624894>`_: `my_var: "{{ 'foo' if my_condition else '' }}"`

**NOTE: This file was intended to only documents gotchas/quirks.**

vars_files:
===========
Ansible (2.1.1.0) currently does not seem to support using a variable input for `var_files`, e.g.

    vars_files:
        `- "{{ variables_file_location }}"`

(At this stage it this would have to be a command line variable using the `--extra-vars` option as `var_files` itself is responsible for loading variables).

Possible `workarounds <https://github.com/ansible/ansible/issues/10000#issuecomment-74472260>`_ include using `pre_tasks` and `include_vars`, e.g.

    pre_tasks:
        `- include_vars: "{{ variables_file_location }}"`

But, this does not seem to execute early enough if you use any of the variables in the root of the playbook, e.g.

    `- hosts: servers`
      pre_tasks:
        `- include_vars: "{{ variables_file_location }}"`
      environment: "{{ local_env }}"

Fortunately, `magic variables <http://docs.ansible.com/ansible/playbooks_variables.html#magic-variables-and-how-to-access-information-about-other-hosts>`_ are available.
If your variables file is in the same location as one of the magic variables points to, then you can do something like:

    vars_files:
        `- "{{ inventory_dir }}/project_vars.yml"`

In this example, the hosts file is included from an external location, and here we also store project_vars.yml. The location is picked up with:

    ansible-playbook -i /path/to/hosts playbook.yml
