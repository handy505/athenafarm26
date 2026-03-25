#!/bin/bash
# AthenaFarm26 - GitLab Pages Deploy Script

echo "========================================"
echo "AthenaFarm26 - GitLab Pages Deploy"
echo "========================================"
echo ""

# Check if remote exists
if ! git remote | grep -q origin; then
    echo "❌ No remote origin set."
    echo ""
    echo "Please run these commands first:"
    echo ""
    echo "  1. Create a new public project on GitLab:"
    echo "     https://gitlab.com/projects/new"
    echo ""
    echo "  2. Add the remote:"
    echo "     git remote add origin https://gitlab.com/YOUR_USERNAME/athenafarm26.git"
    echo ""
    echo "  3. Run this script again:"
    echo "     ./deploy.sh"
    echo ""
    exit 1
fi

# Show current remote
echo "📡 Remote: $(git remote get-url origin)"
echo ""

# Push to GitLab
echo "🚀 Pushing to GitLab..."
git push -u origin master --force

echo ""
echo "✅ Done!"
echo ""
echo "📋 Next steps:"
echo "   1. Go to: https://gitlab.com/YOUR_USERNAME/athenafarm26"
echo "   2. Settings → Pages → New deployment"
echo "   3. Your site will be at:"
echo "      https://YOUR_USERNAME.gitlab.io/athenafarm26/"
echo ""
echo "⏱️  Note: It may take 2-5 minutes for Pages to build."
