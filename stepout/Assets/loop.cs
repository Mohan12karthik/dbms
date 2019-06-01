using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class loop : MonoBehaviour {
    public GameObject automon;
    public float rt = 1.0f;
    private Vector2 sb;

	// Use this for initialization
	void Start () {
        sb = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        StartCoroutine(mon());
	}
    private void spawn()
    {
        GameObject a = Instantiate(automon) as GameObject;
        a.transform.position = new Vector2(sb.x * -2, Random.Range(-sb.y, sb.y));
    }
	// Update is called once per frame
	IEnumerator mon()
    {
        while(true)
        {
            yield return new WaitForSeconds(rt);
            spawn();
        }
    }
}
