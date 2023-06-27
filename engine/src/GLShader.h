#pragma once
#include <glad/glad.h>
#include <map>
#include <string>

using namespace std;

class GLShader
{
public:
  GLShader(void);
  ~GLShader(void);
  void LoadFromString(GLenum whichShader, const string& source);
  void LoadFromFile(GLenum whichShader, const string& filename);
  void CreateAndLinkProgram();
  void Use();
  void UnUse();
  void AddAttribute(const string& attribute);
  void AddUniform(const string& uniform);
  
  //An indexer that returns the location of the attribute/uniform
  GLuint operator[](const string& attribute);
  GLuint operator()(const string& uniform);
  void DeleteShaderProgram();
  GLuint _program;

private:
  enum ShaderType{VERTEX_SHADER, FRAGMENT_SHADER, GEOMETRY_SHADER};
  int _totalShaders;
  GLuint _shaders[3];
  map<string, GLuint> _attributeList;
  map<string, GLuint> _uniformLocationList;
};
