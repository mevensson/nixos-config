# NixOS Configuration Guidelines

## Code Style
- Use `nixfmt` for Nix code formatting (run `nix fmt` to format all files)
- Follow standard Nix indentation and line breaks
- Use descriptive variable names and comments for complex logic

## Architecture
- **Modules**: Reusable configuration components in `modules/` directory
- **Hosts**: Host-specific configurations in `hosts/` directory
- **Users**: User-specific configurations in `users/` directory
- Use flake-based structure with inputs following nixpkgs where possible

## Build and Test
- `nix flake check` - Validate the flake configuration
- `nix fmt` - Format all Nix files using nixfmt
- `nixos-rebuild` - Build and apply configurations (host-specific)
- `gh pr create` - Create pull requests using GitHub CLI</content>
<parameter name="filePath">/home/matte/git/nixos-config/.github/copilot-instructions.md