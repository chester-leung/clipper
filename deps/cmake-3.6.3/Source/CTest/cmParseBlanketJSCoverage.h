/*============================================================================
  CMake - Cross Platform Makefile Generator
  Copyright 2000-2009 Kitware, Inc.

  Distributed under the OSI-approved BSD License (the "License");
  see accompanying file Copyright.txt for details.

  This software is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the License for more information.
============================================================================*/

#ifndef cmParseBlanketJSCoverage_h
#define cmParseBlanketJSCoverage_h

#include "cmCTestCoverageHandler.h"

/** \class cmParseBlanketJSCoverage
 * \brief Parse BlanketJS coverage information
 *
 * This class is used to parse BlanketJS(Pascal) coverage information
 * generated by the Blanket.js library when used in conjunction with the
 * test runner mocha.js, which is used to write out the JSON format.
 *
 *  Blanket.js:
 *  http://blanketjs.org/
 *
 *  Mocha.js
 *  http://visionmedia.github.io/mocha/
 */
class cmParseBlanketJSCoverage
{
public:
  cmParseBlanketJSCoverage(cmCTestCoverageHandlerContainer& cont,
                           cmCTest* ctest);
  bool LoadCoverageData(std::vector<std::string> files);
  //  Read the JSON output
  bool ReadJSONFile(std::string const& file);

protected:
  class JSONParser;
  cmCTestCoverageHandlerContainer& Coverage;
  cmCTest* CTest;
};
#endif