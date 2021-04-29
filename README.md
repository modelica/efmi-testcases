# Repository overview

This repository compiles official test cases for the [eFMI standard](https://efmi-standard.org). It contains different kinds of artefacts to demonstrate and evaluate eFMI, its tooling and applications:

*  `eFMI_TestCases`: [Modelica](https://www.modelica.org/modelicalanguage) library with physics models for various eFMI application scenarios. Each scenario typically comprises a whole system model with test stimuli, physical plant models and the cyber-physical subsystems to develop embedded software for. The whole setup, including its physics, is declaratively modeled in Modelica; eFMI tooling is used to automatically derive embedded software solutions.
* `eFMI`: Modelica library with [Modelica Standard Library (MSL)](https://github.com/modelica/ModelicaStandardLibrary) adapters that ease the application of Modelica in eFMU development contexts.
* `GALEC-examples`: GALEC example programs to demonstrate and test different features of the official intermediate representation eFMI uses to model causal solutions for embedded control problems by means of computational-safe algorithms with multi-dimensional arithmetic (GALEC: **g**uarded **a**lgorithmic **l**anguage for **e**mbedded **c**ontrol; cf. the [eFMI specification](https://efmi-standard.org) for a definition of GALEC).

The `eFMI_TestCases` and `eFMI` Modelica libraries contain comprehensive documentation in their `UsersGuide` packages. Please use your preferred Modelica tooling/IDE to read the documentation for questions regarding how to use the libraries, what is tested/provided, which eFMI tooling is required etc.

## Contributing and repository policy

The main branch (`main`) of the repository is protected. All work must be done on separate branches, with pull requests to merge your new contributions into `main`. Respective pull requests must be reviewed by at least one code owner of the changed artefacts. Please cf. the `CODEOWNERS` file for who to add as reviewer to your pull request.

The organization of the Modelica-based test cases is documented in the `UsersGuide` package of the `eFMI_TestCases` library. Please read it before pushing new contributions; only contributions satisfying the documented library structure are accepted.

## Reporting issues

Please check the available labels and use them. The label descriptions clarify the kind of issues that can be reported. _Every_ issue must be labeled with _one_ collated-to category label (`eFMI library`, `eFMI_TestCases library`, `GALEC examples` or `infrastructure`) denoting the artefacts of the repository the issue is about. The issue also _must_ be categorized if it is an enhancement request or an actual bug (`enhancement` and `bug` labels). The `documentation` label is optional and used to denote that the issue is about the documentation of its collated-to category.