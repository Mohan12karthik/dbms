
using UnityEngine;

public class timescript : MonoBehaviour {

	// Use this for initialization
    public float slowfactor = 0.05f;
    public float slowlen = 2f;

    void slowmo()
    {
        Time.timeScale = slowfactor;
    }
}
