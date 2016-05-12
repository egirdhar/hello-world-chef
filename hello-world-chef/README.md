# chef-repo

My chef repository

## Managed Chef

You'll need a `.chef` directory containing:

- `knife.rb`: generate it using the **Generate Knife Config** option in the
  Organizations page of Managed Chef.
- `<username>.pem`: Your Chef private key. You can generate a new one in the Account Management page of Managed Chef.
- `<organization>-validator.pem`: You can generate a new one using the **Reset
  Validation Key** option in the Organizations page of Managed Chef. This last
  one is optional: you need to copy this file to any newly-created host, so you
  might as well keep it in the `.chef` directory.

## Local Cookbooks

Local cookbooks are in the 'local-cookbooks' directory. To create one:

    berks cookbook my-cookbook local-cookbooks/my-cookbook

To add it to `Berksfile`:

    cookbook 'my-cookbook', path: 'local-cookbooks/my-cookbook'
