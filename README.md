# Repository overview

This repository compiles official test cases for the [eFMI standard](https://efmi-standard.org). It contains different kinds of artefacts to demonstrate and evaluate eFMI, its tooling and applications:

*  `eFMI_TestCases`: [Modelica](https://www.modelica.org/modelicalanguage) library with physics models for various eFMI application scenarios. Each scenario typically comprises a whole system model with test stimuli, physical plant models and the cyber-physical subsystems to develop embedded software for. The whole setup, including its physics, is declaratively modeled in Modelica; eFMI tooling is used to automatically derive embedded software solutions.
* `eFMI`: Modelica library with [Modelica Standard Library (MSL)](https://github.com/modelica/ModelicaStandardLibrary) adapters that ease the application of Modelica in eFMU development contexts.
* `GALEC-examples`: GALEC example programs to demonstrate and test different features of the official intermediate representation eFMI uses to model causal solutions for embedded control problems by means of computational-safe algorithms with multi-dimensional arithmetic (GALEC: **g**uarded **a**lgorithmic **l**anguage for **e**mbedded **c**ontrol; cf. the [eFMI specification](https://efmi-standard.org) for a definition of GALEC).

The `eFMI_TestCases` and `eFMI` Modelica libraries contain comprehensive documentation in their `UsersGuide` packages. Please use your preferred Modelica tooling/IDE to read the documentation for questions regarding how to use the libraries, what is tested/provided, which eFMI tooling is required etc.

## Contributing and repository policy

Please consult the [CONTRIBUTING.md](Contributing.md) for details on how to report issues and contribute to the repository.