using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO.Ports;

public class movement1 : MonoBehaviour {
    public Rigidbody rb;
    public float fwd = 2000f;
    public float side = 5f;
	// Use this for initialization

    SerialPort sp = new SerialPort("COM4", 9600);
    void Start()
    {
        sp.Open();
        sp.ReadTimeout = 1;

    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name==("me1"||"me2"||"me3"||"me4"||"me5"||"me6"))
        {
            Destroy(col.rb);
        }
    }

	// Update is called once per frame
    void FixedUpdate()
    {
        //Time.timeScale = 0.5f *Time.deltaTime;
        rb.AddForce(0, 0, fwd * Time.deltaTime);
        Debug.Log("hello");
        if (Input.GetKey("d"))
        {
            rb.AddForce(side , 0, 0);

        }
        if (Input.GetKey("a"))
        {
            rb.AddForce(-side , 0, 0);

        }
        if (sp.IsOpen)
        {
            Debug.Log("hello");

            if (sp.ReadChar() == '1')
            {
                Debug.Log("f");


                rb.AddForce(side * Time.deltaTime, 0, 0);

            }

            if (sp.ReadChar() == '2')
            {
                Debug.Log("b");
                rb.AddForce(-side * Time.deltaTime, 0, 0);
            }



        }
    }
            
        

		
	}

