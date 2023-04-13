#include <iostream>

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include "GLSLShader.h"

#include <algorithm>

#define GL_CHECK_ERRORS assert(glGetError()==GL_NO_ERROR);


using namespace std;

//screen size
const int WIDTH = 1200;
const int HEIGHT = 960;

//for floating point imprecision
const float EPSILON = 0.001f;
const float EPSILON2 = EPSILON*EPSILON;

//camera tranformation variables
int state = 0, oldX=0, oldY=0;
float rX=0, rY=0, fov = 45;

#include "FreeCamera.h"

//virtual key codes
// const int VK_W = 0x57;
// const int VK_S = 0x53;
// const int VK_A = 0x41;
// const int VK_D = 0x44;
// const int VK_Q = 0x51;
// const int VK_Z = 0x5a;

//delta time
float dt = 0;

//timing related variables
float last_time=0, current_time =0;

//free camera instance
CFreeCamera cam;

//mouse filtering support variables
const float MOUSE_FILTER_WEIGHT=0.75f;
const int MOUSE_HISTORY_BUFFER_SIZE = 10;

//mouse history buffer
glm::vec2 mouseHistory[MOUSE_HISTORY_BUFFER_SIZE];

float mouseX=0, mouseY=0; //filtered mouse values

//flag to enable filtering
bool useFiltering = true;

//output message
#include <sstream>
std::stringstream msg;

//floor checker texture ID
GLuint checkerTextureID;


//checkered plane object
#include "TexturedPlane.h"
CTexturedPlane* checker_plane;

//mouse move filtering function
void filterMouseMoves(float dx, float dy) {
    for (int i = MOUSE_HISTORY_BUFFER_SIZE - 1; i > 0; --i) {
        mouseHistory[i] = mouseHistory[i - 1];
    }

    // Store current mouse entry at front of array.
    mouseHistory[0] = glm::vec2(dx, dy);

    float averageX = 0.0f;
    float averageY = 0.0f;
    float averageTotal = 0.0f;
    float currentWeight = 1.0f;

    // Filter the mouse.
    for (int i = 0; i < MOUSE_HISTORY_BUFFER_SIZE; ++i)
    {
		glm::vec2 tmp=mouseHistory[i];
        averageX += tmp.x * currentWeight;
        averageY += tmp.y * currentWeight;
        averageTotal += 1.0f * currentWeight;
        currentWeight *= MOUSE_FILTER_WEIGHT;
    }

    mouseX = averageX / averageTotal;
    mouseY = averageY / averageTotal;

}

//mouse click handler
void OnMouseDown(GLFWwindow *window, int x, int y)
{
	if (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS)
	{
		oldX = x;
		oldY = y;
	}

	if(glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_MIDDLE) == GLFW_PRESS)
		state = 0;
	else
		state = 1;
}

//mouse move handler
void OnMouseMove(int x, int y)
{
	if (state == 0) {
		fov += (y - oldY)/5.0f;
		cam.SetupProjection(fov, cam.GetAspectRatio());
	} else {
		rY += (y - oldY)/5.0f;
		rX += (oldX-x)/5.0f;
		if(useFiltering)
			filterMouseMoves(rX, rY);
		else {
			mouseX = rX;
			mouseY = rY;
		}
		cam.Rotate(mouseX,mouseY, 0);
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

	if (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS)
	{
		glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_HIDDEN);
		oldX = mouseX;
		oldY = mouseY;
	}

	if(glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_MIDDLE) == GLFW_PRESS)
		state = 0;
	else
		state = 1;

	// if (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS) {
	// 	// Hides mouse cursor
	// 	glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_HIDDEN);
	// 	state = 0;
	// }
	// else
	//  state = 1;

	if (state == 0) {
		fov += (mouseY - oldY)/5.0f;
		cam.SetupProjection(fov, cam.GetAspectRatio());
	} else {
		rY += (mouseY - oldY)/5.0f;
		rX += (oldX-mouseX)/5.0f;
		if(useFiltering)
			filterMouseMoves(rX, rY);
		else {
			mouseX = rX;
			mouseY = rY;
		}
		cam.Rotate(mouseX,mouseY, 0);
	}
	oldX = mouseX;
	oldY = mouseY;
}

//initialize OpenGL
void OnInit() {
	GL_CHECK_ERRORS
	//generate the checker texture
	GLubyte data[128][128]={0};
	for(int j=0;j<128;j++) {
		for(int i=0;i<128;i++) {
			data[i][j]=((i<=64 && j<=64) || (i>64 && j>64) )?255:0;
		}
	}
	//generate texture object
	glGenTextures(1, &checkerTextureID);
	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, checkerTextureID);
	//set texture parameters
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

	GL_CHECK_ERRORS

	//set maximum aniostropy setting
	GLfloat largest_supported_anisotropy;
	glGetFloatv(GL_MAX_TEXTURE_MAX_ANISOTROPY, &largest_supported_anisotropy);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY, largest_supported_anisotropy);

	//set mipmap base and max level
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, 0);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAX_LEVEL, 4);

	//allocate texture object
	glTexImage2D(GL_TEXTURE_2D,0,GL_RED, 128, 128, 0, GL_RED, GL_UNSIGNED_BYTE, data);

	//generate mipmaps
	glGenerateMipmap(GL_TEXTURE_2D);

	GL_CHECK_ERRORS

	//create a textured plane object
	checker_plane = new CTexturedPlane();

	GL_CHECK_ERRORS

	//setup camera
	//setup the camera position and look direction
	glm::vec3 p = glm::vec3(5);
	cam.SetPosition(p);
	glm::vec3 look =  glm::normalize(p);

	//rotate the camera for proper orientation
	float yaw = glm::degrees(float(atan2(look.z, look.x)+M_PI));
	float pitch = glm::degrees(asin(look.y));
	rX = yaw;
	rY = pitch;
	if(useFiltering) {
		for (int i = 0; i < MOUSE_HISTORY_BUFFER_SIZE ; ++i) {
			mouseHistory[i] = glm::vec2(rX, rY);
		}
	}
	cam.Rotate(rX,rY,0);
	cout<<"Initialization successfull"<<endl;
}

//delete all allocated resources
void OnShutdown() {

	delete checker_plane;
	glDeleteTextures(1, &checkerTextureID);
	cout<<"Shutdown successfull"<<endl;
}

//resize event handler
void OnResize(int w, int h) {
	//set the viewport
	glViewport (0, 0, (GLsizei) w, (GLsizei) h);
	//setup the camera projection matrix
	cam.SetupProjection(45, (GLfloat)w/h); 
}

//idle event processing
// void OnIdle() {

// 	//handle the WSAD, QZ key events to move the camera around
// 	if( GetAsyncKeyState(VK_W) & 0x8000) {
// 		cam.Walk(dt);
// 	}

// 	if( GetAsyncKeyState(VK_S) & 0x8000) {
// 		cam.Walk(-dt);
// 	}

// 	if( GetAsyncKeyState(VK_A) & 0x8000) {
// 		cam.Strafe(-dt);
// 	}

// 	if( GetAsyncKeyState(VK_D) & 0x8000) {
// 		cam.Strafe(dt);
// 	}

// 	if( GetAsyncKeyState(VK_Q) & 0x8000) {
// 		cam.Lift(dt);
// 	}

// 	if( GetAsyncKeyState(VK_Z) & 0x8000) {
// 		cam.Lift(-dt);
// 	}

// 	glm::vec3 t = cam.GetTranslation(); 
// 	if(glm::dot(t,t)>EPSILON2) {
// 		cam.SetTranslation(t*0.95f);
// 	}

// 	//call the display function
// 	//glutPostRedisplay();
// }

void processInput(GLFWwindow *window)
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
	{
        glfwSetWindowShouldClose(window, true);
	}

	if (glfwGetKey(window, GLFW_KEY_SPACE) == GLFW_PRESS)
	{
		useFiltering = !useFiltering;
	}

    if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
        cam.Walk(dt);
    if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
        cam.Walk(-dt);
    if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
		cam.Strafe(-dt);
    if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
		cam.Strafe(dt);
	if (glfwGetKey(window, GLFW_KEY_Q) == GLFW_PRESS)
		cam.Lift(dt);
	if (glfwGetKey(window, GLFW_KEY_Z) == GLFW_PRESS)
		cam.Lift(dt);

	glm::vec3 t = cam.GetTranslation(); 
	if(glm::dot(t,t)>EPSILON2)
	{
		cam.SetTranslation(t*0.95f);
	}
}

//display callback function
void OnRender() {
	//timing related calcualtion
	last_time = current_time;
	//current_time = glutGet(GLUT_ELAPSED_TIME)/1000.0f;
	//dt = current_time-last_time;

	float currentFrame = static_cast<float>(glfwGetTime());
    dt = currentFrame - last_time;
    //lastFrame = currentFrame;

	//clear color buffer and depth buffer
	glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
 
	//set the camera transformation
	glm::mat4 MV	= cam.GetViewMatrix();
	glm::mat4 P     = cam.GetProjectionMatrix();
    glm::mat4 MVP	= P*MV;

	//render the chekered plane
	checker_plane->Render(glm::value_ptr(MVP));

	//swap front and back buffers to show the rendered result
	//glutSwapBuffers();

}

//Keyboard event handler to toggle the mouse filtering using spacebar key
// void OnKey(unsigned char key, int x, int y) {
// 	switch(key) {
// 		case ' ':
// 			useFiltering = !useFiltering;
// 		break;
// 	}
// 	glutPostRedisplay();
// }

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

	//print information on screen
	cout<<"\tVendor: "<<glGetString (GL_VENDOR)<<endl;
	cout<<"\tRenderer: "<<glGetString (GL_RENDERER)<<endl;
	cout<<"\tVersion: "<<glGetString (GL_VERSION)<<endl;
	cout<<"\tGLSL: "<<glGetString (GL_SHADING_LANGUAGE_VERSION)<<endl;

	//opengl initialization
	OnInit();

    while (!glfwWindowShouldClose(window))
    {
		//glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
        //glClear(GL_COLOR_BUFFER_BIT);
        OnRender();
		glfw_mouse_inputs(window);
		processInput(window);
		glfwSwapBuffers(window);
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
