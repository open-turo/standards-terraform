# Module: Tests

Terraform tests let authors validate that module configuration updates do not introduce breaking changes. Tests run against test-specific, short-lived resources, preventing any risk to your existing infrastructure or state.

For the latest information, please refer to the official [Terraform Tests](https://developer.hashicorp.com/terraform/language/tests) documentation. Below is an outline of key testing standards.

## Standards

1. Have a setup run that consist of preparing the environment so that it can handle end-to-end testing
2. Contains a main.tftest.hcl
3. Create multiple run steps to separate complex stages

## Phases

A main.tftest.hcl file should be included to handle end-to-end (E2E) tests, which typically consist of a structured series of steps.

### End-To-End (E2E) Test

The E2E test should be defined in main.tftest.hcl at the root of the tests directory and should include the following phases

#### Setup

The setup phase establishes all necessary components required for the module to function correctly. Here, you can create supporting resources, such as identifiers and dependencies, needed by the module.

#### Test Module

The test phase applies variables from the setup phase to test the module. This phase should include assertions to verify the correctness of resources being created, such as:

- Ensuring the correct resource count
- Verifying resource naming conventions
- Validating module outputs

#### Validate Module

The validation phase checks that the resources created by the module are functioning as intended. For example, if the module is designed to replicate an object to another region, this step verifies that replication occurred as expected.

### Unit Testing

Unit testing in Terraform focuses on validating individual modules or smaller portions of your infrastructure code in isolation. Unit tests provide a quick and effective way to identify issues early, without deploying a full environment.

#### Validating Unit Tests

In addition to main.tftest.hcl, you can include a separate file specifically for unit testing parts of the module. This file can validate:

- Error Handling and Invalid Inputs: Ensure the module handles incorrect or missing inputs gracefully.

- Environment-Specific Behavior: Confirm that the module functions as expected across different environments.

- Dependency Relationships: Validate that resources are created in the correct order and that dependencies between resources are respected.

- Module Inputs and Defaults: Test that default values are applied correctly and that the module can handle various input configurations.

- Resource Creation and Configuration: Verify that each resource is created with the correct attributes and configurations.
