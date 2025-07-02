#!/bin/bash

echo "🔍 Current working directory: $(pwd)"
echo "📂 Contents:"
ls -la

# Ensure the configuration directories and files exist
if [ ! -f /var/chef/config/solo.rb ]; then
    echo "❌ solo.rb not found in /var/chef/config/"
    exit 1
fi

if [ ! -f /var/chef/config/web.json ]; then
    echo "❌ web.json not found in /var/chef/config/"
    exit 1
fi

# Change to the repository directory
echo "📦 Changing to repo directory: /var/chef/output/gitRepo"
cd /var/chef/output/gitRepo || { echo "❌ Failed to cd into /var/chef/output/gitRepo"; exit 1; }

echo "🔍 Now in directory: $(pwd)"
ls -la

# Configure Git
echo "🔧 Configuring git user"
git config user.email "ravi.dhyani@mulesoft.com"
git config user.name "ravi-dhyani8881"

# Check if branch exists on remote
if git ls-remote --exit-code --heads origin "$BRANCH_NAME"; then
    echo "✅ Remote branch '$BRANCH_NAME' exists. Checking out."
    git checkout "$BRANCH_NAME"
    git pull origin "$BRANCH_NAME"
else
    echo "🆕 Remote branch '$BRANCH_NAME' does NOT exist. Creating and pushing."
    git checkout -b "$BRANCH_NAME"
    git push --set-upstream https://"$GITHUB_TOKEN"@github.com/ravi-dhyani8881/rest.git "$BRANCH_NAME"
fi

# Run Chef Solo
echo "🍽️ Running chef-solo..."
chef-solo -c /var/chef/config/solo.rb -j /var/chef/config/web.json

# Check for changes
echo "🔍 Checking for Git changes in: $(pwd)"
git_status=$(git status --porcelain)

if [ -n "$git_status" ]; then
    echo "✅ Changes detected, preparing to commit."

    git fetch origin
    git rebase origin/"$BRANCH_NAME"

    git add .
    git commit -m "Automated commit by Docker container" .

    if [ -n "$GITHUB_TOKEN" ]; then
        echo "🚀 Pushing changes to GitHub branch $BRANCH_NAME"
        git push https://"$GITHUB_TOKEN"@github.com/ravi-dhyani8881/rest.git "$BRANCH_NAME"
    else
        echo "⚠️ GITHUB_TOKEN not set. Skipping push."
    fi
else
    echo "🟢 No changes detected, nothing to commit."
fi

# Final directory check
echo "🔍 Final working directory: $(pwd)"
ls -la

# Execute any additional commands
exec "$@"
