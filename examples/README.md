# Example Terraform Configuration

This directory contains example Terraform/OpenTofu configurations to demonstrate `tofu-tree`.

## Files

- `main.tf` - Main Terraform configuration with various resource types
- `modules/nested_module/main.tf` - Example nested module
- `run.sh` - Example script showing how to use `tofu-tree`

## Usage

1. Navigate to this directory:
   ```bash
   cd examples
   ```

2. Initialize Terraform/OpenTofu:
   ```bash
   terraform init
   # or
   tofu init
   ```

3. Run tofu-tree to see the plan as a tree:
   ```bash
   tofu-tree
   # or
   ./run.sh
   ```

4. Or pipe plan output:
   ```bash
   terraform plan -concise -no-color | tofu-tree --input
   ```

## What This Example Shows

This example demonstrates:
- Resources with `for_each` loops
- Nested modules
- Multiple module instances
- Various resource types (local_file)

The tree output will show the hierarchical structure of all planned resource changes.

