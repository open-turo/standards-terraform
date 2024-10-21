# Module: Tests

- Minimum Coverage: It’s recommended that all modules include tests that provide at least minimum coverage of their functionality to help ensure reliability.

- Testing for New Modules: When creating new modules, it’s beneficial to implement tests using the [Terraform test framework](https://developer.hashicorp.com/terraform/tutorials/configuration-language/test) to validate their functionality.

## Essential Tips for Covering Module Functionality in Tests

Tests for terraform modules are important for ensuring functionality, but it's crucial to strike a balance between thorough testing and practical execution time.
When defining tests, prioritize those that provide meaningful coverage without significantly slowing down the development process.
It's helpful to focus on key functionality and ensure that tests are efficient, especially for modules where the full test suite might take a long time to run.
Defining what constitutes a “good test” can guide this balance, ensuring tests are both valuable and manageable.
So let's take a look at some tips for covering module functionality in tests.

Would take an example of a module which creates an S3 bucket.

### Basic Functionality

- Resource Creation: Ensure that the module can successfully create the primary resource with the expected configuration.
  - Example: Validate that the bucket is created with the correct name and ACLs set, etc..

### Output Verification

- Correct Outputs: Check that all expected output values are produced correctly, ensuring they reflect the resource's current state.
  - Example: Verify that the bucket ARN and other relevant information are correctly returned as outputs.

### Input Variables Testing

- Comprehensive Input Testing: Validate all input variables, ensuring that they affect the resource configuration as expected.
  - Example: Test different input combinations for bucket name and access control settings to verify correct behavior.
- Edge Case Handling: Test how the module handles edge cases, such as unusually large or small input values or unexpected data types.
  - Example: Test a bucket name that is the maximum allowed length (63 characters) and a name that is too short or contains invalid characters.

### Error Handling

- Invalid Input Scenarios: Validate that the module gracefully handles invalid or unexpected input values, returning appropriate error messages.
  - Example: Test what happens when an invalid bucket name is provided or an unsupported input value is used.

### Permissions and Policies

- Access Control: Verify that any necessary access policies or IAM roles are correctly applied to the resource.
  - Example: Ensure that the bucket policy allows the necessary actions for the intended use case.
- Security Best Practices: Ensure the module adheres to security best practices, such as restricting public access or enabling encryption.
  - Example: Verify that the bucket is not publicly accessible and that encryption is enabled.

### Lifecycle Management

- Lifecycle Policies: If applicable, test that lifecycle management policies (e.g., deletion, transitions) are correctly configured and enforced.
  - Example: Validate that objects are transitioned to Glacier storage after a certain period.

## Things to Note During Module Updates

- In each iteration it would be beneficial for the tests to pass to confirm that the module is still functioning as expected.
- Please consider updating the tests or adding new ones to address the new functionality.
- It’s important to update the tests or include new tests to account for the breaking changes.
- It would be great if the module could be **PRERELEASED** and tested in a repository that utilizes it, along with a screenshot of the test results included in the PR.
