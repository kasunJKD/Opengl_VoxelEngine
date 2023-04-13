#pragma once
#include "AbstractCamera.h"

class CFreeCamera :
	public CAbstractCamera
{
public:
	CFreeCamera(void);
	~CFreeCamera(void);

	void Update();
	void Rotate(const float yaw, const float pitch, const float roll);
	void Walk(const float amount);
	void Strafe(const float amount);
	void Lift(const float amount);
	 
	void SetTranslation(const glm::vec3& t);
	glm::vec3 GetTranslation() const;

	void SetSpeed(const float speed);
	const float GetSpeed() const;


protected:
	float yaw, pitch, roll, speed;
	
	glm::vec3 translation;
};