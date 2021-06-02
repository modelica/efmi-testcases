# Contributing and repository policy


This project welcomes contributions and suggestions. Please follow the guidelines below before opening new issues or pull requests.

## Contributor license agreement

Any pull requests or commits require you to agree to The _Modelica Association Contributor License Agreement_ (MA CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://github.com/modelica/ModelicaAssociationCLA.

When you submit a pull request, a bot will automatically determine whether you need to provide a MA CLA and decorate the pull request appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once.

## Reporting issues

Please check the available labels and use them. The label descriptions clarify the kind of issues that can be reported. _Every_ issue must be labeled with _one_ collated-to category label (`eFMI library`, `eFMI_TestCases library`, `GALEC examples` or `infrastructure`) denoting the artefacts of the repository the issue is about. The issue also _must_ be categorized if it is an enhancement request or an actual bug (`enhancement` and `bug` labels). The `documentation` label is optional and used to denote that the issue is about the documentation of its collated-to category.

## Branch protection and commits/pull requests

The main branch (`main`) of the repository is protected. All work must be done on separate branches, with pull requests to merge your new contributions into `main`. Respective pull requests must be reviewed by at least one code owner of the changed artefacts. Please cf. the `CODEOWNERS` file for who to add as reviewer to your pull request.

The organization of the Modelica-based test cases is documented in the `UsersGuide` package of the `eFMI_TestCases` library. Please read it before pushing new contributions; only contributions satisfying the documented library structure are accepted.