#include <iostream>

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include "GLSLShader.h"

#define GL_CHECK_ERRORS assert(glGetError()==GL_NO_ERROR);

using namespace std;

//screen size
const int WIDTH = 1200;
const int HEIGHT = 960;

//shader reference
GLSLShader shader;

//vertex array and vertex buffer object IDs
GLuint vaoID;
GLuint vboVerticesID;
GLuint vboIndicesID;

// //out vertex struct for interleaved attributes
// struct Vertex {
// 	glm::vec3 position;
// 	glm::vec3 color;
// };

// //triangle vertices and indices
// Vertex vertices[3];
// GLushort indices[3];

// //projection and modelview matrices
// glm::mat4  P = glm::mat4(1);
// glm::mat4 MV = glm::mat4(1);
const int NUM_X = 40; //total quads on X axis
const int NUM_Z = 40; //total quads on Z axis

const float SIZE_X = 4; //size of plane in world space
const float SIZE_Z = 4;
const float HALF_SIZE_X = SIZE_X/2.0f;
const float HALF_SIZE_Z = SIZE_Z/2.0f;

//ripple displacement speed
const float SPEED = 2;

//ripple mesh vertices and indices
glm::vec3 vertices[(NUM_X+1)*(NUM_Z+1)];
const int TOTAL_INDICES = NUM_X*NUM_Z*2*3;
GLushort indices[TOTAL_INDICES];

//projection and modelview matrices
glm::mat4  P = glm::mat4(1);
glm::mat4 MV = glm::mat4(1);

//camera transformation variables
int state = 0, oldX=0, oldY=0;
float rX=25, rY=-40, dist = -7;

//current time
float timee = 0;

//mosue click handler
void OnMouseDown(int button, int s, int x, int y)
{
	if (s == GLFW_KEY_DOWN)
	{
		oldX = x;
		oldY = y;
	}

	if(button == GLFW_MOUSE_BUTTON_MIDDLE)
		state = 0;
	else
		state = 1;
}

//mosue move handler
void OnMouseMove(int x, int y)
{
	if (state == 0)
		dist *= (1 + (y - oldY)/60.0f);
	else
	{
		rY += (x - oldX)/5.0f;
		rX += (y - oldY)/5.0f;
	}
	oldX = x;
	oldY = y;

	//glutPostRedisplay();
}

void glfw_mouse_inputs(GLFWwindow* window) {
	// Stores the coordinates of the cursor
		double mouseX;
		double mouseY;
		// Fetches the coordinates of the cursor
	glfwGetCursorPos(window, &mouseX, &mouseY);

	if (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS) {
		// Hides mouse cursor
		glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_HIDDEN);
		state = 0;
	}
	else
	 state = 1;

	if (state == 0) {
		dist *= (1 + (mouseY - oldY)/60.0f);
	}
	else
	{
		rY += (mouseX - oldX)/5.0f;
		rX += (mouseY - oldY)/5.0f;
	}
	oldX = mouseX;
	oldY = mouseY;
}


//Opengl initialization
void OnInit() {
//set the polygon mode to render lines
	glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);

	GL_CHECK_ERRORS
	//load shader
	shader.LoadFromFile(GL_VERTEX_SHADER, "shaders/shader.vert");
	shader.LoadFromFile(GL_FRAGMENT_SHADER, "shaders/shader.frag");
	//compile and link shader
	shader.CreateAndLinkProgram();
	shader.Use();
		//add shader attribute and uniforms
		shader.AddAttribute("vVertex");
		shader.AddUniform("MVP");
		shader.AddUniform("timee");
	shader.UnUse();

	GL_CHECK_ERRORS

	//setup plane geometry
	//setup plane vertices
	int count = 0;
	int i=0, j=0;
	for( j=0;j<=NUM_Z;j++) {
		for( i=0;i<=NUM_X;i++) {
			vertices[count++] = glm::vec3( ((float(i)/(NUM_X-1)) *2-1)* HALF_SIZE_X, 0, ((float(j)/(NUM_Z-1))*2-1)*HALF_SIZE_Z);
		}
	}

	//fill plane indices array
	GLushort* id=&indices[0];
	for (i = 0; i < NUM_Z; i++) {
		for (j = 0; j < NUM_X; j++) {
			int i0 = i * (NUM_X+1) + j;
			int i1 = i0 + 1;
			int i2 = i0 + (NUM_X+1);
			int i3 = i2 + 1;
			if ((j+i)%2) {
				*id++ = i0; *id++ = i2; *id++ = i1;
				*id++ = i1; *id++ = i2; *id++ = i3;
			} else {
				*id++ = i0; *id++ = i2; *id++ = i3;
				*id++ = i0; *id++ = i3; *id++ = i1;
			}
		}
	}

	GL_CHECK_ERRORS

	//setup plane vao and vbo stuff
	glGenVertexArrays(1, &vaoID);
	glGenBuffers(1, &vboVerticesID);
	glGenBuffers(1, &vboIndicesID);

	glBindVertexArray(vaoID);

		glBindBuffer (GL_ARRAY_BUFFER, vboVerticesID);
		//pass plane vertices to array buffer object
		glBufferData (GL_ARRAY_BUFFER, sizeof(vertices), &vertices[0], GL_STATIC_DRAW);
		GL_CHECK_ERRORS
		//enable vertex attrib array for position
		glEnableVertexAttribArray(shader["vVertex"]);
		glVertexAttribPointer(shader["vVertex"], 3, GL_FLOAT, GL_FALSE,0,0);
		GL_CHECK_ERRORS
		//pass the plane indices to element array buffer
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, vboIndicesID);
		glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), &indices[0], GL_STATIC_DRAW);
		GL_CHECK_ERRORS
			  
	cout<<"Initialization successfull"<<endl;
}

//release all allocated resources
void OnShutdown() {
	//Destroy shader
	shader.DeleteShaderProgram();

	//Destroy vao and vbo
	glDeleteBuffers(1, &vboVerticesID);
	glDeleteBuffers(1, &vboIndicesID);
	glDeleteVertexArrays(1, &vaoID);

	cout<<"Shutdown successfull"<<endl;
}

//resize event handler
void OnResize(int w, int h) {
	//set the viewport size
	glViewport (0, 0, (GLsizei) w, (GLsizei) h);
	//setup the projection matrix
	P = glm::perspective(glm::radians(45.0f), (GLfloat)w/h, 1.f, 1000.f);
}

//display callback function
void OnRender() {

	// //clear the colour and depth buffer
	// glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

	// //bind the shader
	// shader.Use();
	// 	//pass the shader uniform
	// 	glUniformMatrix4fv(shader("MVP"), 1, GL_FALSE, glm::value_ptr(P*MV));
	// 		//drwa triangle
	// 		glDrawElements(GL_TRIANGLES, 3, GL_UNSIGNED_SHORT, 0);
	// //unbind the shader
	// shader.UnUse();
	 
	// //swap front and back buffers to show the rendered result
	// //glutSwapBuffers();


	//get the elapse time::CHECK
	timee = glfwGetTime()/1000.0f * SPEED;

	glm::mat4 T=glm::translate(glm::mat4(1.0f),
	glm::vec3(0.0f, 0.0f, dist));
	glm::mat4 Rx= glm::rotate(T, rX, glm::vec3(1.0f, 0.0f,
	0.0f));
	glm::mat4 MV= glm::rotate(Rx, rY, glm::vec3(0.0f, 1.0f,
	0.0f));
	glm::mat4 MVP= P*MV;
	shader.Use();
	glUniformMatrix4fv(shader("MVP"), 1, GL_FALSE,
	glm::value_ptr(MVP));
	glUniform1f(shader("timee"), timee);
	glDrawElements(GL_TRIANGLES,TOTAL_INDICES,
	GL_UNSIGNED_SHORT,0);
	shader.UnUse();
	
	//swap front and back buffers to show the rendered result
	//glutSwapBuffers();
}

GLFWwindow *initialize()
{
    int glfwInitRes = glfwInit();
    if (!glfwInitRes)
    {
        std::cout << "Unable to initialize GLFW" << std::endl;
        return nullptr;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

    GLFWwindow *window = glfwCreateWindow(WIDTH, HEIGHT, "OpenGL Boilerplate", nullptr, nullptr);
    if (!window)
    {
        std::cout << "Unable to create GLFW window" << std::endl;
        glfwTerminate();
        return nullptr;
    }

    glfwMakeContextCurrent(window);

    int gladInitRes = gladLoadGL();
    if (!gladInitRes)
    {
        std::cout << "Unable to initialize glad" << std::endl;
        glfwDestroyWindow(window);
        glfwTerminate();
        return nullptr;
    }

    return window;
}

int main() {
    GLFWwindow *window = initialize();
    if (!window)
    {
        return 0;
    }

	cout<<"\tVendor: "<<glGetString (GL_VENDOR)<<endl;
	cout<<"\tRenderer: "<<glGetString (GL_RENDERER)<<endl;
	cout<<"\tVersion: "<<glGetString (GL_VERSION)<<endl;
	cout<<"\tGLSL: "<<glGetString (GL_SHADING_LANGUAGE_VERSION)<<endl;

	//opengl initialization
	OnInit();

    while (!glfwWindowShouldClose(window))
    {
        glClear(GL_COLOR_BUFFER_BIT);
        OnRender();
        glfwSwapBuffers(window);
		glfw_mouse_inputs(window);
        glfwPollEvents();
    }

    glfwTerminate();

	//callback hooks
	//glutCloseFunc(OnShutdown);
	//glutDisplayFunc(OnRender);
	//glutReshapeFunc(OnResize);

	//main loop call
	//glutMainLoop();

	return 0;
}
