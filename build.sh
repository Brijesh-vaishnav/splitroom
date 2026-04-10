#!/bin/bash
# =============================================
# Vercel build script — runs before deployment
# Replaces %%PLACEHOLDERS%% in config.js with
# actual env var values set in Vercel dashboard
# =============================================

set -e

echo "Injecting environment variables into config.js..."

# Check required env vars are set
if [ -z "$SUPABASE_URL" ]; then
  echo "ERROR: SUPABASE_URL environment variable is not set."
  echo "Add it in Vercel Dashboard → Project → Settings → Environment Variables"
  exit 1
fi

if [ -z "$SUPABASE_ANON_KEY" ]; then
  echo "ERROR: SUPABASE_ANON_KEY environment variable is not set."
  echo "Add it in Vercel Dashboard → Project → Settings → Environment Variables"
  exit 1
fi

# Replace placeholders with actual values
sed -i "s|%%SUPABASE_URL%%|$SUPABASE_URL|g" config.js
sed -i "s|%%SUPABASE_ANON_KEY%%|$SUPABASE_ANON_KEY|g" config.js

echo "Done. Config injected successfully."
