package pet.bean;

public class Member {
	private String mID; // ID
	private String mName; // 이름
	private String mNickname; // 닉네임
	private String mPassword; // PASSWORD
	private String mEmail; // EMAIL
	private String mPhone; // 핸드폰 번호
	private String mZipcode; // 우편 번호
	private String mAddress1; // 주소 1
	private String mAddress2; // 주소 2
	private String mDate; // 가입일
	private int mPoint; // 회원 포인트
	private int mLevel; // 회원 등급 (기본 1, 우수 2, 특급 3)
	private int mDrop; // 탈퇴 여부 (기본값 0, 탈퇴시 1)
	
	public Member() {}

	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmZipcode() {
		return mZipcode;
	}

	public void setmZipcode(String mZipcode) {
		this.mZipcode = mZipcode;
	}

	public String getmAddress1() {
		return mAddress1;
	}

	public void setmAddress1(String mAddress1) {
		this.mAddress1 = mAddress1;
	}

	public String getmAddress2() {
		return mAddress2;
	}

	public void setmAddress2(String mAddress2) {
		this.mAddress2 = mAddress2;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public int getmLevel() {
		return mLevel;
	}

	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}

	public int getmDrop() {
		return mDrop;
	}

	public void setmDrop(int mDrop) {
		this.mDrop = mDrop;
	}
}
