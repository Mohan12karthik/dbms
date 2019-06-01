using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shoot : MonoBehaviour {

    public GameObject explosion;
    public Camera cam;

	// Use this for initialization
	
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKey("s"))
            Shoot();
		
	}
    void Shoot()
    {
        RaycastHit _hitInfo;
        if (Physics.Raycast(cam.transform.position,cam.transform.forward,out _hitInfo))
        {
            Instantiate(explosion, _hitInfo.point, Quaternion.LookRotation(_hitInfo.normal));

        }
    }
}
