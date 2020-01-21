{-

Life

Copyright (C) 2020 Jonathan Lamothe <jlamothe1980@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

-}

{-# LANGUAGE TemplateHaskell #-}

module Life.Types (
  -- * Types
  Board (..),
  Section (..),
  SubSections (..),
  -- * Lenses
  -- ** Board Lenses
  boardDepth,
  rootSection,
  -- ** SubSection Lenses
  negXnegY,
  negY,
  posXnegY,
  negX,
  middle,
  posX,
  negXposY,
  posY,
  posXposY,
  -- * Constructors
  newBoard,
  newSubSections,
  ) where

import Lens.Micro.TH (makeLenses)

-- | Defines the game board
data Board = Board
  { _boardDepth  :: Int
  -- ^ The number of levels beneath the root 'Section'
  , _rootSection :: Section
  -- ^ The root section of the 'Board'
  } deriving (Eq, Show)

-- | Defines a section on a 'Board'
data Section
  = EmptySection
  | ActiveCell
  | GridSection SubSections
  deriving (Eq, Show)

-- | Defines a grid od 'Section's
data SubSections = SubSections
  { _negXnegY :: Section
  , _negY     :: Section
  , _posXnegY :: Section
  , _negX     :: Section
  , _middle   :: Section
  , _posX     :: Section
  , _negXposY :: Section
  , _posY     :: Section
  , _posXposY :: Section
  } deriving (Eq, Show)

makeLenses ''Board
makeLenses ''SubSections

-- | Constructor for a 'Board'
newBoard :: Board
newBoard = Board
  { _boardDepth  = 0
  , _rootSection = EmptySection
  }

-- | Constructor for a 'SubSections' value
newSubSections :: SubSections
newSubSections = SubSections
  { _negXnegY = EmptySection
  , _negY     = EmptySection
  , _posXnegY = EmptySection
  , _negX     = EmptySection
  , _middle   = EmptySection
  , _posX     = EmptySection
  , _negXposY = EmptySection
  , _posY     = EmptySection
  , _posXposY = EmptySection
  }

--jl
