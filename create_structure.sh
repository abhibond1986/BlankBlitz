#!/bin/bash

# Create main directories
mkdir -p lib/{core,data,domain,presentation}

# Core layer
mkdir -p lib/core/{constants,utils,extensions,errors,network,config,theme}

# Data layer
mkdir -p lib/data/{models,repositories,datasources/{remote,local},mappers}

# Domain layer
mkdir -p lib/domain/{entities,usecases,repositories,failures}

# Presentation layer
mkdir -p lib/presentation/{screens,widgets,providers,routes,theme}

# Presentation - Screens
mkdir -p lib/presentation/screens/{splash,auth,home,game,lobby,results,profile,shop,leaderboard,tournament,admin,settings}

# Presentation - Widgets  
mkdir -p lib/presentation/widgets/{common,game,lobby,profile,shop,animations}

# Assets
mkdir -p assets/{images/{avatars,icons,backgrounds,effects},sounds/{music,sfx},animations,fonts}

# Tests
mkdir -p test/{unit,widget,integration}
mkdir -p test/unit/{core,data,domain,presentation}

# Firebase
mkdir -p firebase/{functions,rules,indexes}

# Docs
mkdir -p docs

echo "✅ Folder structure created successfully!"
