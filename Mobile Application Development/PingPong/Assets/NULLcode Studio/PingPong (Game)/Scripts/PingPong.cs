using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class PingPong : MonoBehaviour {

	public Transform player;
	public Transform computer;
	public Transform ball;
	public int startBallSpeed = 350;
	public float playerSpeed = 10;
	public float computerSpeed = 2.5f;
	public float playerLimitY = 3.5f;
	public Text playerScoreText;
	public Text computerScoreText;
	private int playerScore;
	private int computerScore;

	void Start () 
	{
		Reset(0);
	}

	void Update () 
	{
		if(Input.GetMouseButtonDown(0))
		{
			ball.GetComponent<Rigidbody2D>().WakeUp();
			Vector2 direction = new Vector2(1,Random.Range(1.5f, -1.5f));
			if(Random.Range(0,2) == 1) direction.x *= -1;
			ball.GetComponent<Rigidbody2D>().AddForce(direction * startBallSpeed);
		}
		else if(Input.GetMouseButtonDown(1))
		{
			Reset(0);
		}

		if(Input.GetAxis("Mouse Y") > 0 && player.position.y < playerLimitY)
		{
			player.Translate(Vector2.up * playerSpeed * Time.deltaTime);
		}
		else if(Input.GetAxis("Mouse Y") < 0 && player.position.y > -playerLimitY)
		{
			player.Translate(-Vector2.up * playerSpeed * Time.deltaTime);
		}

		if(ball.position.x > 0)
		{
			float Y = Mathf.Lerp(computer.position.y, ball.position.y, computerSpeed * Time.deltaTime);
			computer.position = new Vector2(computer.position.x, Y);
		}

		playerScoreText.text = playerScore.ToString();
		computerScoreText.text = computerScore.ToString();
	}

	public void Reset(float x)
	{
		ball.GetComponent<Rigidbody2D>().Sleep();
		computer.position = new Vector2(computer.position.x, 0);
		player.position = new Vector2(player.position.x, 0);
		ball.position = new Vector2(0, 0);
		if(x > 0) playerScore++; else if(x < 0) computerScore++;
	}
}
